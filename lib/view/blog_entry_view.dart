import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/components.dart';
import 'package:flutter_assignment/model/blog_data.dart';
import 'package:provider/provider.dart';

class BlogEntryView extends StatelessWidget {
  static String id = "BlogEntryView";

  @override
  Widget build(BuildContext context) {
    Provider.of<BlogData>(context).getBlogByID();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<BlogData>(
                builder: (context, blogData, child){
                  return  BlogListTile(
                  imageURL: blogData.blog.imageURL,
                  title: blogData.blog.title,
                  time: blogData.blog.time,
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

