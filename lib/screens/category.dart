import 'package:flutter/material.dart';
import 'package:news_app/helper/news_api.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/text_styles.dart';
import 'package:news_app/widgets/article_tile.dart';

class Category extends StatefulWidget {
  final String categoryName;
  Category({this.categoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    getCategoryNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: <Widget>[
              buildNewsList()
            ])),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("News on "),
          Text("Newly", style: TextStyles().appBarTextStyle())
        ],
      ),
    );
  }

  buildNewsList() {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: ListView.builder(
        itemCount: articles.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return ArticleTile(
            imageUrl: articles[index].urlToImage,
            title: articles[index].title,
            desc: articles[index].description,
            url: articles[index].url,
          );
        },
      ),
    );
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.categoryName);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
}
