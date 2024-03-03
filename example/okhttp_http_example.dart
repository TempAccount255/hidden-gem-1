import 'package:http/http.dart';
import 'package:okhttp_http/okhttp_http.dart';

void main() async {
  final Client httpClient = OkhttpClient();

  var url = Uri.https('publicobject.com', '/helloworld.txt');

  final response = await httpClient.get(url);

  print(response.statusCode);
  print(response.reasonPhrase);
  print(response.headers);
  print(response.contentLength);
  print(response.body);
}
