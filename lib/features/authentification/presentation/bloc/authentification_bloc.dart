import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'authentification_event.dart';
import 'authentification_state.dart';

class AuthentificationBloc extends Bloc<AuthentificationEvent, AuthentificationState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthentificationBloc(this.loginUseCase, this.registerUseCase) : super(Initial()) {
    final prefs = SharedPreferencesAsync();

    on<AuthentificationCheckEvent>((event, emit) async {
      emit(Loading());
      try {
        bool isLoggedIn = await prefs.getBool('isLoggedIn') ?? false;

        if (isLoggedIn) {
          final userId = await prefs.getString('userId');
          emit(Authenticated(userId!));
        } else {
          emit(Initial());
        }
      } catch (e) {
        emit(const Error('Ошибка при проверке аутентификации'));
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(Loading());
      try {
        final userId = await loginUseCase.execute(event.username, event.password);

        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('userId', userId);

        emit(Authenticated(userId));
      } catch (e) {
        emit(const Error('Ошибка авторизации'));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(Loading());
      try {
        final userId = await registerUseCase.execute(event.username, event.password);

        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('userId', userId);

        emit(Authenticated(userId));
      } catch (e) {
        emit(const Error('Ошибка регистрации'));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await prefs.remove('isLoggedIn');
      await prefs.remove('userId');

      emit(Initial());
    });
  }

  String get userId {
    return (state as Authenticated).userId;
  }
}
