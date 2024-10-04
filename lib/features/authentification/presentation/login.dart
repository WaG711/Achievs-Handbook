import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentification_bloc.dart';
import 'bloc/authentification_event.dart';
import 'bloc/authentification_state.dart';
import 'widgets/authorization_button.dart';
import 'widgets/changing_login_text_button.dart';
import 'widgets/input_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _userName = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Вход',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              InputField(
                labelText: 'Имя пользователя',
                onChanged: (value) {
                  _userName = value;
                },
              ),
              InputField(
                labelText: 'Пароль',
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(height: 10),
              ChangingLoginTextButton(
                labelText: 'Создать учетную запись',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              ),
              BlocConsumer<AuthentificationBloc, AuthentificationState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    Navigator.pushReplacementNamed(context, '/home', arguments: state.userId);
                  } else if (state is Error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is Loading) {
                    return const CircularProgressIndicator();
                  }
                  return AuthorizationButton(
                    labelText: 'Войти',
                    onPressed: () {
                      context.read<AuthentificationBloc>().add(
                            LoginRequested(_userName, _password),
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
