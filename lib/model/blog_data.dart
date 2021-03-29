import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/controller/blog.dart';
import 'package:flutter_assignment/model/BlogModal.dart';

class BlogData extends ChangeNotifier{

  List<Blog> blog_list = [];
  String blog_current_id = "";
  Blog blog = Blog(time: "",title: "",id: "",imageURL: "");

  void getBlogData() async{
    blog_list = await BlogList().GetBlogList();
    notifyListeners();
  }

  void getBlogByID() async{
    blog = await BlogList().GetBlogById(blog_current_id);
    notifyListeners();
  }

  int getBlogLength(){
    return blog_list.length;
  }

}