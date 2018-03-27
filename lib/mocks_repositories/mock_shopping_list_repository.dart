import 'dart:async';

import '../models/shopping_list.dart';
import '../interfaces/repositories/abstract_shopping_list_repository.dart';

class MockShoppingListRepository implements AShoppingListRepository{

  Future<List<ShoppingList>> getAll({bool includeDeleted : false}) async {
    return new List<ShoppingList>.generate(
        5, (i) => new ShoppingList("List $i"));
  }
}