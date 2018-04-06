import './app_state.dart';
import './actions.dart';
import '../models/shopping_list.dart';

AppState stateReducer(AppState state, action) {

  AppState newState = state;

  if (action is AddShoppingListAction) {
    newState = _onShoppingListAdded(state, action);
  }
  // TODO: add actions
  return state;
}

AppState _onShoppingListAdded(AppState state, action) {
  return state.copyWith(
    shoppingLists: <ShoppingList>[]
      ..addAll(state.shoppingLists)
      ..add((action as AddShoppingListAction).shoppingList)
  );
}