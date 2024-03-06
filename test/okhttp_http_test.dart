import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:okhttp_http/okhttp_http.dart';
import 'package:test/test.dart';

void main() {
  group('okhttp client conformance tests', () {
    testAll(OkhttpClient.new);
  });
}
