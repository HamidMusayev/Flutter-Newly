import 'package:flutter/material.dart';

class TextStyles{
  TextStyle appBarTextStyle(){
    return TextStyle(color: Colors.blue);
  }

  TextStyle articleTitleTextStyle(){
    return TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500);
  }

  TextStyle articleDescriptionTextStyle(){
    return TextStyle(color: Colors.black54, fontSize: 14);
  }
}