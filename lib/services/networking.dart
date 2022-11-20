import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCalls {
  final String url;

  ApiCalls(this.url);
  Future getData() async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var Data = jsonDecode(res.body);
      return Data;
    } else {
      print(res.statusCode);
    }
  }
}
