import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  ListsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListsPageState createState() => new _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title, style: new TextStyle(color: Colors.white),),
      ),
      body: new Row(
        children: <Widget>[

        ],
      ),
    );
  }
}