import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/app_state.dart';
import '../redux/actions.dart';
import '../models/shopping_list.dart';
import '../view_models/shopping_list_view_model.dart';
import '../ui/shopping_list_dialog.dart';
import '../ui/shopping_list_item.dart';


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
  _openEditShoppingListDialog(ShoppingList shoppingList, Function(ShoppingList) onEdittedCallback) async {

    ShoppingList list = await showDialog(
      context: context,
      builder: (BuildContext context) => new ShoppingListDialog.edit(shoppingList)
    );

    if (list != null) {
      list.id = shoppingList.id;
      onEdittedCallback(list);
    }
  }

  // function to open Shopping List Add Button
  _openAddEntryDialog(List<ShoppingList> shoppingLists, Function(ShoppingList) onAddedCallback) async {

    ShoppingList list = await showDialog(
      context: context,
      builder: (BuildContext context) => new ShoppingListDialog.add(),
    );

    if (list != null) {
      onAddedCallback(list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ShoppingListViewModel> (
      converter: (store) {
        return new ShoppingListViewModel(
          shoppingLists: store.state.shoppingLists,
          addEntryCallback: ((list) => store.dispatch(new AddShoppingListAction(list))),
          editEntryCallback: ((list) => store.dispatch(new EditShoppingListAction(list))),
        );
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
                onLongPress: () => _openEditShoppingListDialog(viewModel.shoppingLists[index], viewModel.editEntryCallback),
                child: new ShoppingListItem(viewModel.shoppingLists[index])
              );
            },
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () => _openAddEntryDialog(viewModel.shoppingLists, viewModel.addEntryCallback),
            tooltip: 'Add new Shopping List',
            child: new Icon(Icons.add),
          ),
        );  
      },
    );
  }
}