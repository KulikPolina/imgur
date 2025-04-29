import 'package:core/core.dart';

import '../../data.dart';

class SearchHistoryProvider {
  final SharedPreferences _sharedPreferences;

  const SearchHistoryProvider(this._sharedPreferences);

  Future<void> addQuery({required String query}) {
    final List<String> queries = _sharedPreferences.getStringList(
          StorageConstants.historyPrefsName,
        ) ??
        <String>[];

    queries.add(query);

    final List<String> historyQueries = queries.toSet().toList();

    final int queriesLength = historyQueries.length;


    final HistoryEntity history = HistoryEntity(
      queries: queriesLength > StorageConstants.historyMaxLength
          ? historyQueries.sublist(queriesLength - StorageConstants.historyMaxLength)
          : historyQueries,
    );

    return _sharedPreferences.setStringList(
      StorageConstants.historyPrefsName,
      history.queries,
    );
  }

  Future<void> removeQuery({required String query}) {
    final List<String> queries = _sharedPreferences.getStringList(
          StorageConstants.historyPrefsName,
        ) ??
        <String>[];

    final HistoryEntity history = HistoryEntity(
      queries:
          queries.where((String savedQuery) => savedQuery != query).toList(),
    );

    return _sharedPreferences.setStringList(
      StorageConstants.historyPrefsName,
      history.queries,
    );
  }

  HistoryEntity getSearchHistory() {
    final List<String> queries = _sharedPreferences.getStringList(
          StorageConstants.historyPrefsName,
        ) ??
        <String>[];

    return HistoryEntity(queries: queries);
  }
}
