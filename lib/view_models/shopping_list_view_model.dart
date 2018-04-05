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
<<<<<<< HEAD
  final Function(ShoppingList) editEntryCallback;
  final Function(ShoppingList) addEntryCallback;
=======
  final Function() editShoppingListCallback;
  final Function() addShoppingListCallback;
>>>>>>> 28ac59572bb687c185ff7d83fdf163314dccddae
}
