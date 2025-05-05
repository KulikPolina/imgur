abstract class ExceptionsHandler {
  Future<T> safeExecute<T>({
    required Future<T> Function() execute,
  });
}
