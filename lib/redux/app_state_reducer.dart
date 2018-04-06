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
  }
  // TODO: add actions
  return newState;
}

AppState _onShoppingListAdded(AppState state, action) {
  return state.copyWith(
    shoppingLists: <ShoppingList>[]
      ..addAll(state.shoppingLists)
      ..add((action as AddShoppingListAction).shoppingList)
  );
}