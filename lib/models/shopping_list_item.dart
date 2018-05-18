import './table_data.dart';

class ShoppingListItem extends TableData {
  String name;
  int quantity;

  ShoppingListItem(this.name, {this.quantity, String createdAt, bool deleted, String id,  DateTime updatedAt}) 
    : super(createdAt, deleted, updatedAt);
}