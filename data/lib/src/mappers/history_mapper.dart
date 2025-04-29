import 'package:domain/domain.dart';

import '../entities/entities.dart';

class HistoryMapper {
  static HistoryModel fromEntity(HistoryEntity entity) {
    return HistoryModel(queries: entity.queries);
  }
}
