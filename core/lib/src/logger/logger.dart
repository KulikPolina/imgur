import 'package:logger/logger.dart';

class AppLogger {
  final Logger _log = Logger(
    // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(
      colors: false, // Colorful log messages
    ), // Use the PrettyPrinter to format and print log
  );

  static final AppLogger _singleton = AppLogger._internal();

  AppLogger._internal();
  factory AppLogger() => _singleton;

  /// Log a message at level [Level.trace].
  void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.f(message, error: error, stackTrace: stackTrace);
  }
}
