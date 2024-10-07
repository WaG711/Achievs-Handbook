import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_circular_progress_indicator.dart';
import 'bloc/authentification_bloc.dart';
import 'bloc/authentification_event.dart';
import 'bloc/authentification_state.dart';

class AuthentificationCheck extends StatelessWidget {
  const AuthentificationCheck({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthentificationBloc>().add(const AuthentificationCheckEvent());

    return BlocListener<AuthentificationBloc, AuthentificationState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (state is Initial) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
      child: BlocBuilder<AuthentificationBloc, AuthentificationState>(
        builder: (context, state) {
          if (state is Error) {
            return Center(child: Text('Ошибка: ${state.message}'));
          } else {
            return const Center(child: CustomCircularProgressIndicator());
          }
        },
      ),
    );
  }
}
