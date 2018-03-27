import 'dart:async';

import '../../models/shopping_list.dart';
import '../../interfaces/repositories/abstract_repository.dart';

abstract class AShoppingListRepository implements ARepository<ShoppingList>{

  Future<List<ShoppingList>> getAll({bool includeDeleted : false});
}