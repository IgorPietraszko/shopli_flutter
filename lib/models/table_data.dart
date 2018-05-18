import 'package:uuid/uuid.dart';

abstract class TableData {
  String createdAt;
  bool deleted;
  String id;
  DateTime updatedAt;
  
  TableData(this.createdAt, this.deleted, this.updatedAt) : id = new Uuid().v1().toString();
}