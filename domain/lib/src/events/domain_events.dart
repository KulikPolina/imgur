import 'package:core/core.dart';

sealed class DomainEvent extends AppEvent {
  const DomainEvent();
}

class UnauthorizedEvent extends DomainEvent {
  const UnauthorizedEvent();
}
