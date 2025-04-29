import '../models/models.dart';
import '../payloads/payloads.dart';

abstract interface class LocalHistoryRepository {
  HistoryModel getHistory();

  Future<void> saveRequest({required SearchPostsPayload payload});

  Future<void> removeQuery({required String query});
}
