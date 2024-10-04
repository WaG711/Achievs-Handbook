import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase fetchGames;

  HomeBloc(this.fetchGames) : super(HomeInitial()) {
    on<LoadGames>((event, emit) async {
      await _loadGames(emit);
    });

    on<RefreshGames>((event, emit) async {
      await _loadGames(emit);
    });
  }

  Future<void> _loadGames(Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final games = await fetchGames.execute();
      emit(HomeLoaded(games));
    } catch (e) {
      emit(HomeError("Не удалось загрузить игры"));
    }
  }
}