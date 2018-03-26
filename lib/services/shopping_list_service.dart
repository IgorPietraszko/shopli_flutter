import 'dart:async';

import '../repositories/shopping_list_repository.dart';
import '../interfaces/services/abstract_shopping_list_service.dart';
import '../models/shopping_list.dart';

class ShoppingListsService implements AShoppingListsService{

  ShoppingListRepository _shoppingListRepository;

  Future<List<ShoppingList>> getShoppingLists() async {
    return await _shoppingListRepository.getAll();
  }
}