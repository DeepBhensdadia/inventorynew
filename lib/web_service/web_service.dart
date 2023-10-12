import 'package:http/http.dart';

class WebService {
  static Future<Response> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    Response response = await post(
      Uri.parse(url),
      body: body,
      // headers: {"Content-Type": "application/json"},
    );
    return response;
  }

  static Future<Response> postRequestWithParam({
    required Uri url,
  }) async {
    Response response = await post(
      url,
    );
    return response;
  }
  static Future<Response> getreq({
    required Uri url,
  }) async {
    Response response = await get(
      url,
    );
    return response;
  }
}
