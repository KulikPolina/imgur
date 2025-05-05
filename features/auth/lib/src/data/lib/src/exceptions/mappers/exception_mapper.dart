abstract class ExceptionsMapper<T extends Exception> {
  Exception map(T error);
}
