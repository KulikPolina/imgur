import 'package:domain/domain.dart';

import '../../data.dart';

class LocalHistoryRepositoryImpl implements LocalHistoryRepository {
  final SearchHistoryProvider _searchHistoryProvider;

  const LocalHistoryRepositoryImpl(this._searchHistoryProvider);

  @override
  HistoryModel getHistory() {
    final HistoryEntity result = _searchHistoryProvider.getSearchHistory();
    return HistoryMapper.fromEntity(result);
  }

  @override
  Future<void> saveRequest({required SearchPostsPayload payload}) {
    return _searchHistoryProvider.addQuery(query: payload.query);
  }

  @override
  Future<void> removeQuery({required String query}) {
    return _searchHistoryProvider.removeQuery(query: query);
  }
}
