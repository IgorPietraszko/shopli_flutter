import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/shopping_list.dart';

@immutable
class ShoppingListDialog extends AlertDialog {
  final ShoppingList _shoppingListToEdit;
  String _shoppingListName;
  final TextEditingController _textController = new TextEditingController();

  ShoppingListDialog.edit(this._shoppingListToEdit) {
    TextEditingController _textController = new TextEditingController(
      text: this._shoppingListToEdit.name);
  }
  ShoppingListDialog.add() : _shoppingListToEdit = null {
    TextEditingController _textController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new AlertDialog(
        title: _shoppingListToEdit == null
          ? const Text("Add Shopping List")
          : const Text("Edit Shopping List"),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Shopping List Name",
                ),
                controller: _textController,
                onChanged: (value) => _shoppingListName = value,
              ),        
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          new FlatButton(
            child: _shoppingListToEdit == null
              ? const Text("Add")
              : const Text("Rename"),
            onPressed: () => Navigator.of(context).pop(new ShoppingList(_shoppingListName)),
          )
        ],
      ),
    );
  }
}