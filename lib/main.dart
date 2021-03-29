import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/blog_data.dart';
import 'package:flutter_assignment/view/blog_entry_view.dart';
import 'package:flutter_assignment/view/blog_list_view.dart';
import 'package:flutter_assignment/view/login_screen_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> BlogData(),
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        title: 'Flutter Assignment',
          routes: {
            LoginScreen.id :(BuildContext context) => LoginScreen(),
            BlogListView.id :(BuildContext context) => BlogListView(),
            BlogEntryView.id :(BuildContext context) => BlogEntryView(),
          },
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}

