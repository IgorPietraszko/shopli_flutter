import './table_data.dart';

class ShoppingList extends TableData {
  String name;
  ShoppingList(this.name, {String createdAt, bool deleted, String id,  DateTime updatedAt}) : super(createdAt, deleted, id, updatedAt);
}