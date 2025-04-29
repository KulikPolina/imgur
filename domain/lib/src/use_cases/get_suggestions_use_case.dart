import '../../domain.dart';
import 'use_case.dart';

class GetSuggestionsUseCase implements FutureUseCase<String, HistoryModel> {
  final LocalHistoryRepository _localHistoryRepository;

  const GetSuggestionsUseCase(this._localHistoryRepository);

  @override
  Future<HistoryModel> execute(String input) async {
    final HistoryModel history = _localHistoryRepository.getHistory();

    return HistoryModel(
      queries: history.queries
          .where((String query) => query.contains(input))
          .toList(),
    );
  }
}
