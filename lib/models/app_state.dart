import 'package:meta/meta.dart';
import './shopping_list.dart';
import './app_view.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<ShoppingList> shoppingLists;
  final AppView activeView;

  AppState({this.isLoading = false, this.shoppingLists = const [], this.activeView = AppView.shoppingLists});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({bool isLoading, List<ShoppingList> shoppingLists, AppView activeView}) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      shoppingLists: shoppingLists ?? this.shoppingLists,
      activeView: activeView ?? this.activeView
    );
  }

  AppState stateReducer(AppState state, action) {
    // TODO: add actions
    return state;
  }

  @override
  int get hashCode => isLoading.hashCode ^ shoppingLists.hashCode ^ activeView.hashCode;

  @override
  bool operator == (Object other) => 
    identical(this, other) ||
      other is AppState &&
      runtimeType == other.runtimeType &&
      isLoading == other.isLoading &&
      shoppingLists == other.shoppingLists &&
      activeView == other.activeView;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, shoppingLists: $shoppingLists, activeView: $activeView}';
  }
}