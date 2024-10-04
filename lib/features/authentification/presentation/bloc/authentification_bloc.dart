import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'authentification_event.dart';
import 'authentification_state.dart';

class AuthentificationBloc extends Bloc<AuthentificationEvent, AuthentificationState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthentificationBloc(this.loginUseCase, this.registerUseCase): super(Initial()) {
    on<LoginRequested>((event, emit) async {
      emit(Loading());
      try {
        final userId = await loginUseCase.execute(event.username, event.password);
        emit(Authenticated(userId));
      } catch (e) {
        emit(const Error('Ошибка авторизации'));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(Loading());
      try {
        final userId = await registerUseCase.execute(event.username, event.password);
        emit(Authenticated(userId));
      } catch (e) {
        emit(const Error('Ошибка регистрации'));
      }
    });
  }
}
