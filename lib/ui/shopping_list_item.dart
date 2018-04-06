import 'package:flutter/material.dart';

import '../models/shopping_list.dart';

class ShoppingListItem extends StatelessWidget {
  final ShoppingList shoppingList;

  ShoppingListItem(this.shoppingList);

 @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new Expanded(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Column(
                      children: [
                        new Text(
                          shoppingList.name,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.left,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Divider(
          height: 1.0,
        )
      ],
    );
  }

}