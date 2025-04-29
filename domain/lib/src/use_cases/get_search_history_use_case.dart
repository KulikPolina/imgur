import '../../domain.dart';
import 'use_case.dart';

class GetSearchHistoryUseCase implements FutureUseCase<void, HistoryModel> {
  final LocalHistoryRepository _localHistoryRepository;

  const GetSearchHistoryUseCase(this._localHistoryRepository);

  @override
  Future<HistoryModel> execute([void input]) async {
    return _localHistoryRepository.getHistory();
  }
}
