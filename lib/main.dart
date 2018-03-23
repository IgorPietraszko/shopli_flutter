import 'package:flutter/material.dart';
import './lists_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ShopLi',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new ListsPage(title: 'ShopLi'),
    );
  }
}


