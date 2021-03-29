import 'dart:convert';
import 'dart:io';

import 'package:flutter_assignment/controller/blog.dart';
import 'package:flutter_assignment/model/LoginUser.dart';
import 'package:http/http.dart' as http;


class BlogList{

  Future<List<Blog>> GetBlogList() async{
    print("Getting Blogs");
    final response = await http.get(
      'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs',
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: UserLogin.user_token},
    );
    List<Blog> blogs;
     blogs = await (json.decode(response.body) as List).map((i) =>
        Blog.fromJson(i)).toList();
    return  blogs;
  }

  Future<Blog> GetBlogById(String id) async{
    print("Getting Blogs By ID");
    final response = await http.get(
      'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/${id}',
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: UserLogin.user_token},
    );
    return Blog.fromJson(jsonDecode(response.body));
  }
}