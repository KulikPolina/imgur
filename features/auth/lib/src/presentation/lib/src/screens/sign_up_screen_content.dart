import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_bloc/auth_bloc.dart';

// TODO(): Change UI according to your requirements
class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({super.key});

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  late final AuthBloc _bloc;
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: _bloc,
          builder: (BuildContext context, AuthState state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      label: Text('email'),
                      hintText: 'Enter your email please',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextEditingController,
                  ),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      label: const Text('password'),
                      hintText: 'Enter your password please',
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    controller: _passwordTextEditingController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _bloc.add(
                      SignUpWithCredentials(
                        login: _emailTextEditingController.text,
                        password: _passwordTextEditingController.text,
                      ),
                    ),
                    child: const Text('Create account'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () => _bloc.add(NavigateToLogin()),
                          child: const Text('Login')),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
