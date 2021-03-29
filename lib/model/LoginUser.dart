import 'dart:convert';

import 'package:http/http.dart' as http;

class UserLogin{

  static String user_token;
  Future<dynamic> createLoginPostRequest(String email,String password) async{
    var url = 'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login';
    var response = await http.post(
        url,
        body: {
          'email': email,
          'password': password
        }
        );
    String data = response.body;
     //checking status
    if (response.statusCode == 201){
      user_token = jsonDecode(data)['token'].toString();
      return jsonDecode(data)['token'];
    }
  }
}