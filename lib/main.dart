import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './widgets/lists_page.dart';
import './dependency_injection/injector.dart';
import './redux/app_state.dart';
import './redux/app_state_reducer.dart';

// folowing loosely this post: https://github.com/MSzalek-Mobile/weight_tracker/blob/v0.4.1/lib/home_page.dart

void main() {
  // simple mock according to: https://medium.com/@develodroid/flutter-iv-mvp-architecture-e4a979d9f47e
  Injector.configure(Flavor.MOCK);
  runApp(new ShopLiApp());
}

class ShopLiApp extends StatelessWidget {

  final store = new Store<AppState>(stateReducer, initialState: new AppState.loading());

  ShopLiApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'ShopLi',
        theme: new ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: new ListsPage(title: 'ShopLi'),      
      )
    );
  }
}


