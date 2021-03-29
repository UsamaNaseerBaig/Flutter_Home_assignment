import 'package:flutter_assignment/model/LoginUser.dart';

class User{
  String email;
  String password;

  User({this.password,this.email});

  void CreatePOSTRequest(){
     UserLogin().createLoginPostRequest(email, password);
  }
}