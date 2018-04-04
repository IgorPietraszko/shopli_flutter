import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/app_state.dart';
import '../models/shopping_list.dart';
import '../view_models/shopping_list_view_model.dart';
import '../widgets/shopping_list_dialog.dart';
import '../widgets/shopping_list_item.dart';


class ListsPage extends StatefulWidget {
  ListsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListsPageState createState() => new _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  // controls ListView defined below
  ScrollController _listViewScrollController = new ScrollController();

  // function to open Shopping List Edit Dialog
  _openEditShoppingListDialog(ShoppingList shoppingList, Function(ShoppingList) onSubmittedCallback) async {
    
    ShoppingList newEntry = await Navigator.of(context).push(
      new MaterialPageRoute<ShoppingList>(
        builder: (BuildContext context) {
          return new ShoppingListDialog.edit(shoppingList);
        },
        fullscreenDialog: true,
      ),
    );
    
    if (newEntry != null) {
        newEntry.id = shoppingList.id;
        onSubmittedCallback(newEntry);
      }
  }

  // function to open Shopping List Edit Dialog
  _openAddShoppingListDialog(Function(ShoppingList) onSubmittedCallback) async {
    
    ShoppingList newEntry = await Navigator.of(context).push(
      new MaterialPageRoute<ShoppingList>(
        builder: (BuildContext context) {
          return new ShoppingListDialog.add();
        },
        fullscreenDialog: true,
      ),
    );
    
    onSubmittedCallback(newEntry);
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ShoppingListViewModel> (
      converter: (store) {
        return new ShoppingListViewModel(shoppingLists: store.state.shoppingLists);
      },

      builder: (context, viewModel) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title, style: new TextStyle(color: Colors.white),),
          ),
          body: new ListView.builder(
            shrinkWrap: true,
            controller: _listViewScrollController,
            itemCount: viewModel.shoppingLists.length,
            itemBuilder: (buildContext,index) {
              return new InkWell(
                onTap: () => _openEditShoppingListDialog(viewModel.shoppingLists[index], viewModel.editShoppingListCallback()),
                child: new ShoppingListItem(viewModel.shoppingLists[index])
              );
            },
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () => _openAddShoppingListDialog(viewModel.addShoppingListCallback()),
            tooltip: 'Add new Shopping List',
            child: new Icon(Icons.add),
          ),
        );  
      },
    );
  }
}