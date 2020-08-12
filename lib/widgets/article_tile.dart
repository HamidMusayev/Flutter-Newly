import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/article.dart';
import 'package:news_app/utils/text_styles.dart';

class ArticleTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  ArticleTile({@required this.imageUrl, @required this.title, @required this.desc, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Article(articleUrl: url)));
      },
      child: Container(
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
      ),
    );
  }
}
