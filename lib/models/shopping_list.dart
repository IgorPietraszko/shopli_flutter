import './table_data.dart';
import './shopping_list_item.dart';

class ShoppingList extends TableData {
  String name;
  List<ShoppingListItem> shoopingListItems;

  ShoppingList(this.name, {String createdAt, bool deleted, String id,  DateTime updatedAt}) 
    : super(createdAt, deleted, updatedAt);
}