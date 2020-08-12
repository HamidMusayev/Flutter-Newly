import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=7c91f88f8b664bca860ca1cd076cc027";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {

      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {

          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              //publishedAt: element["publishedAt"],
              content: element["context"]
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=7c91f88f8b664bca860ca1cd076cc027";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {

      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {

          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              //publishedAt: element["publishedAt"],
              content: element["context"]
          );

          news.add(articleModel);
        }
      });
    }
  }
}
