import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("News on"), Text("Newly", style: TextStyle(color: Colors.blue),)],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(),
    );
  }
}

