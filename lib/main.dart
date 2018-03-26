import 'package:flutter/material.dart';

import './lists_page.dart';
import './dependency_injection/injector.dart';


void main() {
  Injector.configure(Flavor.MOCK);
  runApp(new ShopLiApp());
}

class ShopLiApp extends StatelessWidget {


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


