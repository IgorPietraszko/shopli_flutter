import './app_state.dart';
import './actions.dart';
import '../models/shopping_list.dart';

AppState stateReducer(AppState state, action) {

  AppState newState = state;

  if (action is AddShoppingListAction) {
    List<ShoppingList> lists = new List<ShoppingList>()
      ..addAll(state.shoppingLists)
      ..add(action.shoppingList);
    newState = new AppState(shoppingLists: lists);
  } else if (action is EditShoppingListAction) {
    var oldShoppingList = state.shoppingLists.singleWhere((list) => list.id == action.shoppingList.id);
     List<ShoppingList> lists = new List<ShoppingList>()
      ..addAll(state.shoppingLists)
      ..[state.shoppingLists.indexOf(oldShoppingList)] = action.shoppingList;
    newState = new AppState(shoppingLists: lists);
  }
  // TODO: add actions
  return newState;
}