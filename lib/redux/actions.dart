import '../models/shopping_list.dart';

class AddShoppingListAction {
  final ShoppingList shoppingList;

  AddShoppingListAction(this.shoppingList);
}

class EditShoppingListAction {
  final ShoppingList shoppingList;

  EditShoppingListAction(this.shoppingList);
}