import '../../domain.dart';
import 'use_case.dart';

class RemoveSearchHistoryUseCase implements FutureUseCase<String, void> {
  final LocalHistoryRepository _localHistoryRepository;

  const RemoveSearchHistoryUseCase(
    this._localHistoryRepository,
  );

  @override
  Future<void> execute(String input) {
    return _localHistoryRepository.removeQuery(query: input);
  }
}
