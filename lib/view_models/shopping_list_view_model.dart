import 'package:meta/meta.dart';

import '../models/shopping_list.dart';

@immutable
class ShoppingListViewModel {
  // fields
  final List<ShoppingList> shoppingLists;

  // ctor
  ShoppingListViewModel({
    this.shoppingLists,
    this.editEntryCallback,
    this.addEntryCallback
  });

  // functions
  final Function(ShoppingList) editEntryCallback;
  final Function(ShoppingList) addEntryCallback;
}
