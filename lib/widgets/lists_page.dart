import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/app_state.dart';
import '../redux/actions.dart';
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
<<<<<<< HEAD
  _openEditShoppingListDialog(ShoppingList shoppingList, Function(ShoppingList) onEdittedCallback) async {

=======
  _openEditShoppingListDialog(ShoppingList shoppingList, Function(ShoppingList) onSubmittedCallback) async {
    
>>>>>>> 28ac59572bb687c185ff7d83fdf163314dccddae
    ShoppingList newEntry = await Navigator.of(context).push(
      new MaterialPageRoute<ShoppingList>(
        builder: (BuildContext context) {
          return new ShoppingListDialog.edit(shoppingList);
        },
        fullscreenDialog: true,
      ),
    );
<<<<<<< HEAD

    if (newEntry != null) {
      newEntry.id = shoppingList.id;
      onEdittedCallback(newEntry);
    }
  }

  // function to open Shopping List Add Button
  _openAddEntryDialog(List<ShoppingList> shoppingLists, Function(ShoppingList) onAddedCallback) async {
    
    ShoppingList entry = await Navigator.of(context).push(
=======
    
    if (newEntry != null) {
        newEntry.id = shoppingList.id;
        onSubmittedCallback(newEntry);
      }
  }

  // function to open Shopping List Edit Dialog
  _openAddShoppingListDialog(Function(ShoppingList) onSubmittedCallback) async {
    
    ShoppingList newEntry = await Navigator.of(context).push(
>>>>>>> 28ac59572bb687c185ff7d83fdf163314dccddae
      new MaterialPageRoute<ShoppingList>(
        builder: (BuildContext context) {
          return new ShoppingListDialog.add();
        },
<<<<<<< HEAD
        fullscreenDialog: false)
    );

    if (entry != null) {
      onAddedCallback(entry);
    }
=======
        fullscreenDialog: true,
      ),
    );
    
    onSubmittedCallback(newEntry);
>>>>>>> 28ac59572bb687c185ff7d83fdf163314dccddae
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
<<<<<<< HEAD
                onTap: () => _openEditShoppingListDialog(viewModel.shoppingLists[index], viewModel.editEntryCallback),
=======
                onTap: () => _openEditShoppingListDialog(viewModel.shoppingLists[index], viewModel.editShoppingListCallback()),
>>>>>>> 28ac59572bb687c185ff7d83fdf163314dccddae
                child: new ShoppingListItem(viewModel.shoppingLists[index])
              );
            },
          ),
          floatingActionButton: new FloatingActionButton(
<<<<<<< HEAD
            onPressed: () => _openAddEntryDialog(viewModel.shoppingLists, viewModel.addEntryCallback),
=======
            onPressed: () => _openAddShoppingListDialog(viewModel.addShoppingListCallback()),
>>>>>>> 28ac59572bb687c185ff7d83fdf163314dccddae
            tooltip: 'Add new Shopping List',
            child: new Icon(Icons.add),
          ),
        );  
      },
    );
  }
}