import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_circular_progress_indicator.dart';
import 'bloc/authentification_bloc.dart';
import 'bloc/authentification_event.dart';
import 'bloc/authentification_state.dart';
import 'widgets/authorization_button.dart';
import 'widgets/changing_login_text_button.dart';
import 'widgets/input_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _userName = '';
  String _password = '';
  String _repeatPassword = '';

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
                'Регистрация',
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
                  }),
              InputField(
                  labelText: 'Пароль',
                  onChanged: (value) {
                    _password = value;
                  }),
              InputField(
                  labelText: 'Подтверждение пароля',
                  onChanged: (value) {
                    _repeatPassword = value;
                  }),
              const SizedBox(height: 10),
              ChangingLoginTextButton(
                labelText: 'Войти',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
              BlocConsumer<AuthentificationBloc, AuthentificationState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (state is Error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is Loading) {
                    return const CustomCircularProgressIndicator();
                  }
                  return AuthorizationButton(
                    labelText: 'Создать учетную запись',
                    onPressed: () {
                      if (_password == _repeatPassword) {
                        context.read<AuthentificationBloc>().add(
                              RegisterRequested(_userName, _password),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Пароли не совпадают')),
                        );
                      }
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
