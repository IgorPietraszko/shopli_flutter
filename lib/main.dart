import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './widgets/lists_page.dart';
import './dependency_injection/injector.dart';
import './redux/app_state.dart';
import './redux/app_state_reducer.dart';

void main() {
  // simple mock 
  Injector.configure(Flavor.MOCK);
  runApp(new ShopLiApp());
}

class ShopLiApp extends StatelessWidget {

  final store = new Store<AppState>(stateReducer, initialState: new AppState());

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


