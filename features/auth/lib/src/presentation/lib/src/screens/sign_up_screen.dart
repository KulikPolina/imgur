import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

import '../../../../domain/lib/domain.dart';
import '../auth_bloc/auth_bloc.dart';
import 'screens.dart';


@RoutePage<String>()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
      child: const SignUpScreenContent(),
    );
  }
}
