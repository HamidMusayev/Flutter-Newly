import 'package:flutter/material.dart';
import 'package:news_app/helper/article_data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
          child: _loading
              ? Center(child: CircularProgressIndicator())
              : Column(children: <Widget>[
                buildCategoryList(),
                buildNewsList()
          ])
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("News on "),
          Text("Newly", style: TextStyle(color: Colors.blue))
        ],
      ),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  buildCategoryList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 70,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryTile(
                imageUrl: categories[index].imageUrl,
                categoryName: categories[index].categoryName);
          }),
    );
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  buildNewsList() {
    return Container(
      child: ListView.builder(
        itemCount: articles.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return BlogTile(
            imageUrl: articles[index].urlToImage,
            title: articles[index].title,
            desc: articles[index].description,
          );
        },
      ),
    );
  }
}
