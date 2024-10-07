import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase fetchGames;
  String? _currentQuery;

  HomeBloc(this.fetchGames) : super(HomeInitial()) {
    on<LoadGames>((event, emit) async {
      emit(HomeLoading());
      try {
        final games = await fetchGames.execute(event.userId);
        emit(HomeLoaded(games));
      } catch (e) {
        emit(HomeError("Не удалось загрузить игры"));
      }
    });

    on<RefreshGames>((event, emit) async {
      await _loadGames(event.userId, emit);
    });

    on<SearchGames>((event, emit) async {
      _currentQuery = event.query;
      await _loadGames(event.userId, emit);
    });
  }

  Future<void> _loadGames(String userId, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final games = await fetchGames.execute(userId);

      final filteredGames = _currentQuery != null && _currentQuery!.isNotEmpty
          ? games
              .where((game) => game.title
                  .toLowerCase()
                  .contains(_currentQuery!.toLowerCase()))
              .toList()
          : games;

      emit(HomeLoaded(filteredGames));
    } catch (e) {
      emit(HomeError("Не удалось загрузить игры"));
    }
  }
}
