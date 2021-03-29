import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants.dart';

class ActionButton extends StatelessWidget {

  final Function onTap;
  final String name;

  ActionButton({this.onTap,this.name});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        name,
        style: kTextStyle,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kFillerColour),
        side: MaterialStateProperty.all(
            BorderSide(width: 2, color: kTextColor)),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
        elevation: MaterialStateProperty.all(24),
      ),
    );
  }
}

//input fields

class InputField extends StatelessWidget {

  final TextInputType type;
  final String name;
  final Function onChange;
  final bool focus;
  final bool isVisible;
  InputField({this.name,this.focus,this.onChange,this.type,this.isVisible});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        obscureText: isVisible,
        keyboardType: type,
        onChanged: onChange,
        style: kTextStyle,
        autofocus: focus!=null?focus:false,
        cursorColor: kFillerColour,
        decoration: InputDecoration(
            fillColor: kFillerColour,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kFillerColour, width: 2.0),
            ),
            border: OutlineInputBorder(),
            labelText: name,
            labelStyle: kTextStyle
        ),
      ),
    );
  }
}


class BlogListTile extends StatelessWidget {

  final String title;
  final String imageURL;
  final String time;

  BlogListTile({this.title,this.imageURL,this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
            child: Divider(
              color: kTextColor,
              indent: 13,
              endIndent: 22,
            ),
          ),
          Text(title,style: kLabelStyle,),
          GetImageWidgetViaUrl(
            url: imageURL,
            height: 300,
            width: 300,
          ),
          Text(time,style: kTextStyle,),
          SizedBox(
            height: 24,
            child: Divider(
              color: kTextColor,
              indent: 13,
              endIndent: 22,
            ),
          ),
        ],
      ),
    );
  }
}


class GetImageWidgetViaUrl extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  GetImageWidgetViaUrl({this.url,this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20,bottom: 20),
      height: height,
      width: width,
      child:url != null?Container(
        child: Image.network(url),
        decoration: BoxDecoration(
            border: Border.all(
                color: kTextColor,
                width: 3
            )
        ),
      ):Text("Add Photo"),
    );

  }
}