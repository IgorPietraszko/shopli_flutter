import 'dart:async';

import '../../models/table_data.dart';

abstract class ARepository<T extends TableData> {
  Future<List<T>> getAll({bool includeDeleted : false});
}