import 'dart:async';

import '../repositories/abstract_shopping_list_repository.dart';
import '../../models/shopping_list.dart';

abstract class AShoppingListsService {

  AShoppingListRepository _shoppingListRepository;

  Future<List<ShoppingList>> getShoppingLists() async {
    return await _shoppingListRepository.getAll();
  }
}