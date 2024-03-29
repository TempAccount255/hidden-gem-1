import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:jni/jni.dart';
import 'package:path/path.dart';

import 'jni/jni_bindings.dart';

class OkhttpClient extends BaseClient {
  bool _isClosed = false;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (_isClosed) {
      throw ClientException(
          'HTTP request failed. Client is already closed.', request.url);
    }

    final receivePort = ReceivePort();
    final events = StreamQueue<dynamic>(receivePort);

    await Isolate.spawn(_executeBackgroundHttpRequest, (
      url: request.url.toString(),
      method: request.method,
      headers: request.headers,
      body: await request.finalize().toBytes(),
      followRedirects: request.followRedirects,
      sendPort: receivePort.sendPort,
    ));

    final statusCode = await events.next as int;
    final reasonPhrase = await events.next as String;
    final responseHeaders = await events.next as Map<String, String>;
    final isRedirect = await events.next as bool;

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
        receivePort.close();
      }
    }

    return StreamedResponse(responseBodyStream(events.rest), statusCode,
        isRedirect: isRedirect,
        contentLength: _contentLength(responseHeaders),
        request: request,
        headers: responseHeaders,
        reasonPhrase: reasonPhrase);
  }

  void _executeBackgroundHttpRequest(
      ({
        String url,
        String method,
        Map<String, String> headers,
        Uint8List body,
        bool followRedirects,
        SendPort sendPort
      }) args) {
    final client = OkHttpClient()
        .newBuilder()
        .followRedirects(args.followRedirects)
        .build();

    final builder = Request_Builder();

    builder.url1(args.url.toString().toJString());

    args.headers.forEach(
        (key, value) => builder.header(key.toJString(), value.toJString()));

    builder.method(
        args.method.toJString(), _initRequestBody(args.method, args.body));

    final response = client.newCall(builder.build()).execute();

    args.sendPort.send(response.code());
    args.sendPort.send(response.message().toDartString(releaseOriginal: true));
    args.sendPort.send(_responseHeaders(response.headers1()));
    args.sendPort.send(response.isRedirect());

    final bufferSize = 4 * 1024;
    final bytesArray = JArray(jbyte.type, bufferSize);
    final responseBodyStream = response.body().source();

    try {
      while (true) {
        final bytesCount = responseBodyStream.read(bytesArray);
        if (bytesCount == -1) break;

        args.sendPort.send(bytesArray.toUint8List(length: bytesCount));
      }
    } catch (e) {
      args.sendPort.send(ClientException(e.toString()));
    }

    args.sendPort.send(null);
  }

  int? _contentLength(Map<String, String> headers) {
    final contentLength = headers['content-length'];
    if (contentLength == null) return null;

    try {
      final parsedContentLength = int.parse(contentLength);
      if (parsedContentLength < 0) {
        throw ClientException(
            'Invalid content-length header [$contentLength].');
      }
      return parsedContentLength;
    } on FormatException {
      throw ClientException('Invalid content-length header [$contentLength].');
    }
  }

  Map<String, String> _responseHeaders(Headers responseHeaders) {
    final headers = <String, List<String>>{};

    for (var i = 0; i < responseHeaders.size(); i++) {
      final headerName = responseHeaders.name(i);
      final headerValue = responseHeaders.value(i);

      headers
          .putIfAbsent(
              headerName.toDartString(releaseOriginal: true).toLowerCase(),
              () => [])
          .add(headerValue.toDartString(releaseOriginal: true));
    }

    return headers.map((key, value) => MapEntry(key, value.join(',')));
  }

  bool _allowsRequestBody(String method) {
    return !(method == 'GET' || method == 'HEAD');
  }

  RequestBody _initRequestBody(String method, Uint8List body) {
    if (!_allowsRequestBody(method)) return RequestBody.fromRef(nullptr);

    return RequestBody.create2(MediaType.fromRef(nullptr), body.toJArray());
  }

  OkhttpClient() {
    final jniLibsDir = join('build', 'jni_libs');
    final jarDir = 'mvn_jar';

    final jars = Directory(jarDir)
        .listSync()
        .map((e) => e.path)
        .where((path) => path.endsWith('.jar'))
        .toList();

    if (!Platform.isAndroid) {
      Jni.spawnIfNotExists(dylibDir: jniLibsDir, classPath: jars);
    }
  }

  @override
  void close() {
    _isClosed = true;
    super.close();
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
