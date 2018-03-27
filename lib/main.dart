import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


import './pages/lists_page.dart';
import './dependency_injection/injector.dart';
import './models/app_state.dart';
import './models/app_state_reducer.dart';

void main() {
  Injector.configure(Flavor.MOCK);
  runApp(new ShopLiApp());
}

class ShopLiApp extends StatelessWidget {

  final store = new Store<AppState>(
    stateReducer,
    initialState: new AppState.loading(),
  );

  ShopLiApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ShopLi',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new StoreProvider(
        store: store,
        child: new ListsPage(title: 'ShopLi'),
      ),      
    );
  }
}


