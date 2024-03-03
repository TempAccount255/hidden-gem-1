import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:jni/jni.dart';
import 'package:okhttp_http/src/third_party/okhttp3/_package.dart';
import 'package:path/path.dart';

class OkhttpClient extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final receivePort = ReceivePort();
    final events = StreamQueue<dynamic>(receivePort);

    Isolate.spawn(_executeBackgroundHttpRequest,
        (request: request, sendPort: receivePort.sendPort));

    final int statusCode = await events.next;
    final String reasonPhrase = await events.next;
    final Map<String, String> responseHeaders = await events.next;
    final int contentLength = await events.next;

    return StreamedResponse(responseBodyStream(events.rest), statusCode,
        contentLength: contentLength,
        request: request,
        headers: responseHeaders,
        reasonPhrase: reasonPhrase);
  }

  void _executeBackgroundHttpRequest(
      ({BaseRequest request, SendPort sendPort}) args) async {
    _initJVM();

    final OkHttpClient client = OkHttpClient();
    final builder = Request_Builder();

    builder.url1(args.request.url.toString().toJString());

    args.request.headers
        .forEach((k, v) => builder.addHeader(k.toJString(), v.toJString()));

    builder.method(
        args.request.method.toJString(),
        _initRequestBody(args.request.method,
            await args.request.finalize().bytesToString()));

    final response = client.newCall(builder.build()).execute();

    args.sendPort.send(response.code());
    args.sendPort.send(response.message().toDartString());
    args.sendPort.send(_responseHeaders(response.headers1()));
    args.sendPort.send(response.body().contentLength());

    //send response body chunk by chunk
    final bytesBuffer = JArray(jbyte.type, 4 * 1024);
    final responseBodyStream = response.body().source();
    while (true) {
      final bytesCount = responseBodyStream.read(bytesBuffer);

      if (bytesCount == -1) break;

      args.sendPort.send(bytesBuffer.toUint8List(length: bytesCount));
    }

    args.sendPort.send(null);
  }

  Map<String, String> _responseHeaders(Headers responseHeaders) {
    final map = <String, List<String>>{};

    for (int i = 0; i < responseHeaders.size(); i++) {
      final headerName = responseHeaders.name(i);
      final headerValue = responseHeaders.value(i);

      map
          .putIfAbsent(headerName.toDartString().toLowerCase(), () => [])
          .add(headerValue.toDartString());
    }

    return map.map((key, value) => MapEntry(key, value.join(',')));
  }

  bool _allowsRequestBody(String method) {
    return !(method == "GET" || method == "HEAD");
  }

  RequestBody _initRequestBody(String method, String body) {
    if (!_allowsRequestBody(method)) return RequestBody.fromRef(nullptr);

    return RequestBody.create(MediaType.fromRef(nullptr), body.toJString());
  }

  void _initJVM() {
    final jniLibsDir = join('build', 'jni_libs');
    final jarDir = "mvn_jar";

    List<String> jars = Directory(jarDir)
        .listSync()
        .map((e) => e.path)
        .where((path) => path.endsWith('.jar'))
        .toList();

    if (!Platform.isAndroid) {
      Jni.spawnIfNotExists(dylibDir: jniLibsDir, classPath: jars);
    }
  }

  Stream<List<int>> responseBodyStream(Stream<dynamic> events) async* {
    try {
      await for (final event in events) {
        if (event is List<int>) {
          yield event;
        } else if (event is ClientException) {
          throw event;
        } else if (event == null) {
          return;
        }
      }
    } finally {
      // TODO: Should we kill the isolate here?
      // receivePort.close();
    }
  }
}

extension on Uint8List {
  JArray<jbyte> toJArray() =>
      JArray(jbyte.type, length)..setRange(0, length, this);
}

extension on JArray<jbyte> {
  Uint8List toUint8List({int? length}) {
    length ??= this.length;
    final list = Uint8List(length);
    for (var i = 0; i < length; i++) {
      list[i] = this[i];
    }
    return list;
  }
}
