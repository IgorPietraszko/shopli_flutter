import 'package:flutter/material.dart';

import '../models/shopping_list.dart';

class ShoppingListDialog extends StatefulWidget {
  final ShoppingList shoppingListToEdit;

  ShoppingListDialog.edit(this.shoppingListToEdit);

  @override
  ShoppingListDialogState createState() {
    return new ShoppingListDialogState(shoppingListToEdit != null ? shoppingListToEdit.name : null);
  }
}

class ShoppingListDialogState extends State<ShoppingListDialog> {
  String _shoppingListName;
  TextEditingController _textController;

  ShoppingListDialogState(this._shoppingListName);

  Widget _createAppBar(BuildContext context) {
    return new AppBar(
      title: widget.shoppingListToEdit == null
          ? const Text("New entry")
          : const Text("Edit entry"),
      actions: [
        new FlatButton(
          onPressed: () {
            Navigator
                .of(context)
                .pop(new ShoppingList(_shoppingListName));
          },
          child: new Text('SAVE',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white)),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController(text: _shoppingListName);
  }

  @override
  Widget build(BuildContext conext) {
    return new Scaffold(
      appBar: _createAppBar(context),
      body: new TextField(
        decoration: new InputDecoration(
          hintText: "Shopping List Name",
        ),
        controller: _textController,
        onChanged: (value) => _shoppingListName = value,
      ),
    );
  }

}