part of 'app_error_handler_bloc.dart';

sealed class AppErrorHandlerEvent {
  const AppErrorHandlerEvent();
}

class CoreEventReceived extends AppErrorHandlerEvent {
  final CoreEvent data;

  const CoreEventReceived(this.data);
}

class DomainEventReceived extends AppErrorHandlerEvent {
  final DomainEvent data;

  const DomainEventReceived(this.data);
}
