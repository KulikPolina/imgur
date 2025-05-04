part of 'auth_cubit.dart';

class AuthState {
  final UserModel? currentUser;
  final bool isLoginInvalid;
  final bool isPasswordInvalid;
  final bool isLoading;

  const AuthState({
    required this.currentUser,
    required this.isLoginInvalid,
    required this.isPasswordInvalid,
    required this.isLoading,
  });

  const AuthState.initial()
      : currentUser = null,
        isLoginInvalid = false,
        isPasswordInvalid = false,
        isLoading = false;

  AuthState copyWith({
    UserModel? currentUser,
    bool? isLoginInvalid,
    bool? isPasswordInvalid,
    bool? invalidCredentials,
    bool? isLoading,
  }) {
    return AuthState(
      currentUser: currentUser ?? this.currentUser,
      isLoginInvalid: isLoginInvalid ?? this.isLoginInvalid,
      isPasswordInvalid: isPasswordInvalid ?? this.isPasswordInvalid,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
