import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'app_error_handler_event.dart';
part 'app_error_handler_state.dart';

class AppErrorHandlerBloc extends Bloc<AppErrorHandlerEvent, AppErrorHandlerState> {
  final AppEventObserver _appEventObserver;
  final List<StreamSubscription<AppEvent>> _subscriptions = <StreamSubscription<AppEvent>>[];

  AppErrorHandlerBloc({
    required AppEventObserver appEventObserver,
  })  : _appEventObserver = appEventObserver,
        super(const AppErrorHandlerState()) {
    on<CoreEventReceived>(_onCoreEventReceived);
    on<DomainEventReceived>(_onDomainEventReceived);

    _subscriptions.add(
      _appEventObserver.observe<CoreEvent>(
        (CoreEvent event) => add(CoreEventReceived(event)),
      ),
    );

    _subscriptions.add(
      _appEventObserver.observe<DomainEvent>(
        (DomainEvent event) => add(DomainEventReceived(event)),
      ),
    );
  }

  Future<void> _onCoreEventReceived(
    CoreEventReceived event,
    Emitter<AppErrorHandlerState> emit,
  ) async {
    switch (event.data) {
      case InternetConnectionLostEvent():
      // TODO: Handle InternetConnectionLostEvent
      default:
    }
  }

  Future<void> _onDomainEventReceived(
    DomainEventReceived event,
    Emitter<AppErrorHandlerState> emit,
  ) async {
    switch (event.data) {
      case UnauthorizedEvent():
      // TODO: Handle UnauthorizedEvent
      default:
    }
  }

  @override
  Future<void> close() async {
    for (final StreamSubscription<AppEvent> subscription in _subscriptions) {
      await subscription.cancel();
    }

    await super.close();
  }
}
