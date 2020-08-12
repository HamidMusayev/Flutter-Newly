import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/text_styles.dart';

class ArticleTile extends StatelessWidget {
  final String imageUrl, title, desc;
  ArticleTile({@required this.imageUrl, @required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
          SizedBox(height: 6),
          Text(title, style: TextStyles().articleTitleTextStyle()),
          SizedBox(height: 6),
          Text(desc, style: TextStyles().articleDescriptionTextStyle())
        ],
      ),
    );
  }
}
