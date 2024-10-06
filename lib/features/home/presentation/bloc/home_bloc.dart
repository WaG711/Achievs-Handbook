import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase fetchGames;

  HomeBloc(this.fetchGames) : super(HomeInitial()) {
    on<LoadGames>((event, emit) async {
      await _loadGames(event.userId, emit);
    });

    on<RefreshGames>((event, emit) async {
      await _loadGames(event.userId, emit);
    });

    on<SearchGames>((event, emit) async {
      if (state is HomeLoaded) {
        try {
          final games = await fetchGames.execute(event.userId);
          
          final filteredGames = games
              .where((game) =>
                  game.title.toLowerCase().contains(event.query.toLowerCase()))
              .toList();
          emit(HomeLoaded(filteredGames));
        } catch (e) {
          emit(HomeError("Не удалось загрузить игры"));
        }
      }
    });
  }

  Future<void> _loadGames(String userId, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final games = await fetchGames.execute(userId);
      emit(HomeLoaded(games));
    } catch (e) {
      emit(HomeError("Не удалось загрузить игры"));
    }
  }
}
