import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:okhttp_http/okhttp_http.dart';
import 'package:test/test.dart';

void main() {
  group('okhttp client conformance tests', () {
    testIsolate(OkhttpClient.new);
    testResponseBody(OkhttpClient());
    testResponseBodyStreamed(OkhttpClient());
    testResponseHeaders(OkhttpClient());
    testResponseStatusLine(OkhttpClient());
    testRequestBody(OkhttpClient());
    testRequestHeaders(OkhttpClient());
    testMultipleClients(OkhttpClient.new);
  });
}
