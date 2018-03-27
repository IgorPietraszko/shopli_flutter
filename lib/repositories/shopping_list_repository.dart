import 'dart:async';

import '../models/shopping_list.dart';
import '../interfaces/repositories/abstract_shopping_list_repository.dart';

class ShoppingListRepository implements AShoppingListRepository{

  Future<List<ShoppingList>> getAll({bool includeDeleted : false}) async {

    // this has the same functionality as the mock right now but will go
    // to Firebase in the future
    return new List<ShoppingList>.generate(
        5, (i) => new ShoppingList("List $i"));
  }
}