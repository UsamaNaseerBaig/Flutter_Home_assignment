import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/components.dart';
import 'package:flutter_assignment/model/blog_data.dart';
import 'package:flutter_assignment/view/blog_entry_view.dart';
import 'package:provider/provider.dart';

class BlogListView extends StatelessWidget {
  static String id = "BlogListView";

  @override
  Widget build(BuildContext context){
    Provider.of<BlogData>(context).getBlogData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Consumer<BlogData>(
                  builder: (context, blogData, child){
                    return  ListView.builder(
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            blogData.blog_current_id = blogData.blog_list[index].id;
                            Navigator.pushNamed(context, BlogEntryView.id);
                          },
                          child: BlogListTile(
                            title: blogData.blog_list[index].title,
                            time: blogData.blog_list[index].time,
                            imageURL:blogData.blog_list[index].imageURL,
                          ),
                        );
                      },
                      itemCount: blogData.getBlogLength(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

