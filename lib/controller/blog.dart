class Blog{
  final String title;
  final String  imageURL;
  final String time;
  final String id;

  Blog({this.title,this.time,this.id,this.imageURL});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      id: json['id'],
      time: json['createdAt'],
      imageURL: json['imageUrl'],
    );
  }
}