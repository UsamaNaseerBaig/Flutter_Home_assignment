import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/components.dart';
import 'package:flutter_assignment/constants.dart';
import 'package:flutter_assignment/controller/user_controller.dart';
import 'package:flutter_assignment/view/blog_list_view.dart';

class LoginScreen extends StatefulWidget {

  static String id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                   "Log In",
                  textAlign: TextAlign.center,
                  style: kLabelStyle.copyWith(letterSpacing:2)
              ),
              SizedBox(
                height: 24,
              ),
              InputField(
                name: "Email",
                type: TextInputType.emailAddress,
                isVisible: false,
                onChange: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 24,
              ),
              InputField(
                isVisible: true,
                name: "Password",
                type: TextInputType.visiblePassword,
                onChange: (value){
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 13,
              ),
              ActionButton(
                name: "Submit",
                onTap:  (){
                  var obj = User(email:email,password:password);
                  obj.CreatePOSTRequest();
                  Navigator.pushNamed(context, BlogListView.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
