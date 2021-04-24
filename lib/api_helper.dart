import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper _apiHelper;
  final String _baseUrl = "reqres.in";

  static ApiHelper getInstance() {
    if (_apiHelper == null) {
      _apiHelper = new ApiHelper();
    }

    return _apiHelper;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.https(_baseUrl, url));
      if (response.statusCode == 200) {
        responseJson = response.body.toString();
        return responseJson;
      }
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }
}
