import './table_data.dart';

class ShoppingList implements TableData {
  // TableData
  String createdAt;
  bool deleted;
  String id;
  DateTime updatedAt;

  // ShoppingList
  String name;
  ShoppingList(this.name);
}