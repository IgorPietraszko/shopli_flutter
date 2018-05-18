import './app_state.dart';
import './actions.dart';
import '../models/shopping_list.dart';

AppState stateReducer(AppState state, action) {

  if (action is AddShoppingListAction) {
    return _addShoppingList(state, action);
  } else if (action is EditShoppingListAction) {
    return _editShoppingList(state, action);
  }

  return state;
}

AppState _editShoppingList(AppState state, EditShoppingListAction action) {
  var oldShoppingList = state.shoppingLists.singleWhere((list) => list.id == action.shoppingList.id);
  List<ShoppingList> lists = new List<ShoppingList>()
    ..addAll(state.shoppingLists)
    ..[state.shoppingLists.indexOf(oldShoppingList)] = action.shoppingList;
  return state.copyWith(shoppingLists: lists);
}

AppState _addShoppingList(AppState state, AddShoppingListAction action) {
  List<ShoppingList> lists = new List<ShoppingList>()
    ..addAll(state.shoppingLists)
    ..add(action.shoppingList);
  return state.copyWith(shoppingLists: lists);
}