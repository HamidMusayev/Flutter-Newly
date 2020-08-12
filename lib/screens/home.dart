import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            buildCategoryList()
          ],
        )
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
}
