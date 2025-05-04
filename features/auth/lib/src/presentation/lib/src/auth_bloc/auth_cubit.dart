import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AppRouter _appRouter;
  final SignUpWithCredentialsUseCase _signUpWithCredentialsUseCase;
  final SignInWithSessionIdUseCase _authoriseWithSessionIdUseCase;
  final SignInWithCredentialsUseCase _authoriseWithCredentialsUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUsecase _getCurrentUserUseCase;

  AuthCubit(
    this._appRouter,
    this._signUpWithCredentialsUseCase,
    this._authoriseWithSessionIdUseCase,
    this._authoriseWithCredentialsUseCase,
    this._signOutUseCase,
    this._getCurrentUserUseCase,
  ) : super(const AuthState.initial());

  Future<void> signUpWithCredentials(String login, String password) async {
    if (!_isCredentialsValid(login: login, password: password)) return;

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? user = await _signUpWithCredentialsUseCase.execute(
        SignUpPayloadModel(login: login, password: password),
      );
      emit(state.copyWith(currentUser: user));
      if (user != null) {
        debugPrint('User signed up event occurred!');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signInWithSessionId() async {
    try {
      final UserModel? user =
          await _authoriseWithSessionIdUseCase.execute(const NoParams());
      emit(state.copyWith(currentUser: user));
      if (user != null) {
        debugPrint('User logged via sessionId event occurred!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signInWithCredentials(String login, String password) async {
    //if (!_isCredentialsValid(login: login, password: password)) return;

    if (login != 'admin' || password != '1111') {
      emit(state.copyWith(isLoginInvalid: true, isPasswordInvalid: true));
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? user = await _authoriseWithCredentialsUseCase.execute(
        SignInPayloadModel(login: login, password: password),
      );
      emit(state.copyWith(currentUser: user));
      if (user != null) {
        debugPrint('User logged in event occurred!');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signOut() async {
    await _signOutUseCase.execute(const NoParams());
    emit(state.copyWith(currentUser: null));
  }

  Future<void> getCurrentUser() async {
    try {
      final UserModel? user =
          await _getCurrentUserUseCase.execute(const NoParams());
      emit(state.copyWith(currentUser: user));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigateToLogin() {
    // Implement navigation logic here
  }

  void navigateToSignUp() {
    debugPrint('Navigated to sign up triggered');
    // Implement navigation logic here
  }

// TODO(): Add your own validation condition
  bool _isCredentialsValid({
    required String login,
    required String password,
  }) {
    //final bool isLoginValid = _isLoginValid(login);
    //final bool isPasswordValid = _isPasswordValid(password);

    final bool isLoginValid = login == 'admin';
    final bool isPasswordValid = password == '1111';

    emit(state.copyWith(
      isLoginInvalid: !isLoginValid,
      isPasswordInvalid: !isPasswordValid,
    ));

    return isLoginValid && isPasswordValid;
  }

// TODO(): Add your own validation condition
  bool _isLoginValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

// TODO(): Add your own validation condition
  bool _isPasswordValid(String password) {
    return password.length >= 8 && password.length <= 20;
  }
}
