import '../interfaces/repositories/abstract_shopping_list_repository.dart';
import '../interfaces/services/abstract_shopping_list_service.dart';
import '../mocks_repositories/mock_shopping_list_repository.dart';
import '../repositories/shopping_list_repository.dart';
import '../services/shopping_list_service.dart';

enum Flavor {
  MOCK,
  PROD
}

/// Simple DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  // repo specific getters
  AShoppingListRepository get shoppingListRepository {
    switch(_flavor) {
      case Flavor.MOCK: return new MockShoppingListRepository();
      default: return new ShoppingListRepository(); // Flavor.PROD:
    }
  }

  // service specific getters
  AShoppingListsService get shoppingListService {
    switch(_flavor) {
      default: return new ShoppingListsService();
    }
  }
}