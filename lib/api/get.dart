import 'dart:convert';

import 'package:api_test/models/models.dart';
import 'package:http/http.dart' as http;

class Api {
  static getData() async {
    final url = Uri.parse(
        'https://sewcode-backend.onrender.com/api/v1/user/test/show-business');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      return json;
    }
  }

  static postAddress(Address a) async {
    try {
      final url = Uri.parse(
          'https://tailor-app-backend-2o5l.onrender.com/api/v1/user/save-address');

      final response = await http.post(url, body: a.toJson());
      //print('response: ${response.statusCode}');

      if (response.statusCode == 200) {
        // String? message = 'success';
        // print('message is $message');
        return 'success';
      } else {
        return 'error';
      }
    } catch (e) {
     // print(e);
    }
  }
}
