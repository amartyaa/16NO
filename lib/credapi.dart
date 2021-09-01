// ignore_for_file: file_names, avoid_print

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CredAPI {
  static const String partnerkey = "e701dc4118e27cbca8f636f22a362397";
  late final String phone;

  //Constructor
  CredAPI({required this.phone});

  //Functions in CREDAPI
  //bakwas function
  Future<CredAPI> getCred(String id) async {
    return CredAPI(phone: '');
  }

  static Future<String> getOTP(String phone) async {
    final response = await http.post(
      Uri.parse('https://credaccess.web.app/auth/generateOtp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'credaccess-secret-key': partnerkey
      },
      body: jsonEncode(<String, String>{
        'phone': phone,
      }),
    );

    if (response.statusCode == 200) {
      //encodes the JSONstring response into map and returns value of key token
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<dynamic> verifyOTP(
      String token, String otp) async {
    final response = await http.post(
      Uri.parse('https://credaccess.web.app/auth/verifyOtp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'credaccess-secret-key': partnerkey
      },
      body: jsonEncode(<String, String>{'token': token, 'otp': otp}),
    );
    // var c = jsonDecode(response.body);
    // var a = {jsonDecode(response.body)['access_token'],jsonDecode(response.body)['existing_user']};
    return jsonDecode(response.body);
  }
}
