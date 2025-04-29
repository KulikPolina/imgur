import 'dart:async';

abstract class AppEvent {
  const AppEvent();
}

abstract class AppEventNotifier {
  void notify(AppEvent event);
}

abstract class AppEventObserver {
  StreamSubscription<T> observe<T extends AppEvent>(
    void Function(T event) handler, {
    bool observeEventsOfExactType = false,
  });
}
