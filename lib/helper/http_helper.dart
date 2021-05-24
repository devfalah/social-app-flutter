import 'package:http/http.dart' as http;
import 'package:socialapp/helper/helper.dart';

class HttpHelper {
  static Future<http.Response> post(
      {String path, Object body, Map<String, String> headers}) async {
    var url = Uri.parse('$mainUrl/$path');

    return await http.post(url, body: body, headers: headers);
  }

  static Future<http.Response> get(
      {String path, Map<String, String> headers}) async {
    var url = Uri.parse('$mainUrl/$path');
    return await http.get(
      url,
      headers: headers,
    );
  }
}
