// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CredAPI {
  static const String partnerkey = "553491c57ccaf4c737bba2b9be909a20";
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

  static Future<dynamic> verifyOTP(String token, String otp) async {
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

  static Future<dynamic> createUser(String accesstoken, String firstname,
      String lastname, String email) async {
    print("partnerke:  " + partnerkey);
    print("AccKey:  " + accesstoken);
    final curesponse = await http.post(
        Uri.parse(' https://backend-16no.herokuapp.com/storeUserDetails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'credaccess-secret-key': partnerkey,
          'credaccess-access-token': accesstoken
        },
        body: jsonEncode(<String, String>{
          'first_name': firstname,
          'last_name': lastname,
          'email': email
        }));

    return jsonEncode(curesponse.body);
  }

  static Future<dynamic> getUser(String accesstoken) async {
    final guresponse = await http.get(
        Uri.parse(' https://backend-16no.herokuapp.com/getUserDetails'),
        headers: <String, String>{
          'credaccess-access-token': accesstoken,
          'credaccess-secret-key': partnerkey
        });

    return jsonDecode(guresponse.body);
  }
}
