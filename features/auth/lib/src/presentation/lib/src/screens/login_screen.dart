import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

import '../../../../core/lib/core.dart';
import '../../../../domain/lib/domain.dart';
import '../auth_bloc/auth_bloc.dart';
import 'screens.dart';

final GetIt authLocator = GetIt.instance;

@RoutePage<String>()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(
        signUpWithCredentialsUseCase: authLocator.get<SignUpWithCredentialsUseCase>(),
        signInWithSessionIdUseCase: authLocator.get<SignInWithSessionIdUseCase>(),
        signInWithCredentialsUseCase: authLocator.get<SignInWithCredentialsUseCase>(),
        signOutUseCase: authLocator.get<SignOutUseCase>(),
        getCurrentUserUseCase: authLocator.get<GetCurrentUserUsecase>(),
      )..add(SignInWithSessionId()),
      child: const LoginScreenContent(),
    );
  }
}
