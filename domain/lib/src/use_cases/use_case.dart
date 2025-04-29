abstract interface class UseCase<Input, Output> {
  Output execute(Input input);
}

abstract interface class FutureUseCase<Input, Output> {
  Future<Output> execute(Input input);
}

abstract interface class StreamUseCase<Input, Output> {
  Stream<Output> execute(Input input);
}

class NoParams {
  const NoParams();
}
