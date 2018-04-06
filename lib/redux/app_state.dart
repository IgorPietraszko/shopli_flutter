import 'package:meta/meta.dart';
import '../models/shopping_list.dart';

@immutable
class AppState {
  final List<ShoppingList> shoppingLists;

  AppState({this.shoppingLists = const []});

  //factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({List<ShoppingList> shoppingLists}) {
    return new AppState(
      shoppingLists: shoppingLists ?? this.shoppingLists,
    );
  }

  @override
  int get hashCode => shoppingLists.hashCode;

  @override
  bool operator == (Object other) => 
    identical(this, other) ||
      other is AppState &&
      runtimeType == other.runtimeType &&
      shoppingLists == other.shoppingLists;

  @override
  String toString() {
    return 'AppState{shoppingLists: $shoppingLists}';
  }
}