part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpWithCredentials extends AuthEvent {
  final String login;
  final String password;

  SignUpWithCredentials({
    required this.login,
    required this.password,
  });
}

class SignInWithSessionId extends AuthEvent {}

class SignInWithCredentials extends AuthEvent {
  final String login;
  final String password;

  SignInWithCredentials({
    required this.login,
    required this.password,
  });
}

class GetCurrentUser extends AuthEvent {}

class NavigateToLogin extends AuthEvent {}

class NavigateToSignUp extends AuthEvent {}

class SignOut extends AuthEvent {}
