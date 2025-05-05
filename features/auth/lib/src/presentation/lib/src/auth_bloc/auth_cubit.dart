import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AppRouter _appRouter;
  final SignUpWithCredentialsUseCase _signUpWithCredentialsUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUsecase _getCurrentUserUseCase;

  AuthCubit(
    this._appRouter,
    this._signUpWithCredentialsUseCase,
    this._signOutUseCase,
    this._getCurrentUserUseCase,
  ) : super(const AuthState.initial());

Future<void> onSignUpWithCredentials(
      {required String login, required String password}) async {
    if (!_isCredentialsValid(
      login: login,
      password: password,
    )) {
      // TODO():  Add unsupported formatting handling
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? createdUser =
          await _signUpWithCredentialsUseCase.execute(
        SignUpPayloadModel(
          login: login,
          password: password,
        ),
      );
      emit(state.copyWith(currentUser: createdUser));

      if (createdUser != null) {
        await _appRouter.replace(const LoginScreen());
        debugPrint('User signed up event occurred!');
      }
    } on Exception catch (e) {
      // TODO(): Add exception handling
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

    Future<void> onSignInWithCredentials(
      {required String login, required String password}) async {
    if (!_isCredentialsValid(
      login: login,
      password: password,
    )) {
      // TODO():  Add unsupported formatting handling
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {

      final UserModel userModel = UserModel(login: login);

      emit(state.copyWith(currentUser: userModel));

      await _appRouter.replace(const MainRoute());
      debugPrint('User logged in event occurred!');
    } on Exception catch (e) {
      // TODO(): Add exception handling
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

 Future<void> onSignOut() async {
    await _signOutUseCase.execute(const NoParams());

    emit(state.copyWith(currentUser: null));
  }

  Future<void> onGetCurrentUser() async {
    try {
      final UserModel? currentUser =
          await _getCurrentUserUseCase.execute(const NoParams());

      emit(state.copyWith(currentUser: currentUser));
    } on Exception catch (e) {
      // TODO(): Add exception handling
      debugPrint(e.toString());
    }
  }

  void onNavigateToSignIn() {
    _appRouter.replace(const LoginScreen());
  }

  void onNavigateToSignUp() {
    // redirection to sign up screen logic
    _appRouter.replace(const SignUpScreen());
    debugPrint('Navigated to sign up triggered');
  }

// TODO(): Add your own validation condition
  bool _isCredentialsValid({
    required String login,
    required String password,
  }) {
    if (!_isLoginValid(login)) {
      emit(state.copyWith(isLoginInvalid: true));
      return false;
    }

    if (!_isPasswordValid(password)) {
      emit(state.copyWith(isPasswordInvalid: true));
      return false;
    }

    emit(
      state.copyWith(
        isLoginInvalid: false,
        isPasswordInvalid: false,
      ),
    );

    return true;
  }

// TODO(): Add your own validation condition
  bool _isLoginValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

// TODO(): Add your own validation condition
  bool _isPasswordValid(String password) {
    if (password.length < 8 || password.length > 20) return false;
    return true;
  }
}
