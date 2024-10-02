import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/fetch_games.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final FetchGames fetchGames;

  GameBloc(this.fetchGames) : super(GameInitial()) {
    on<LoadGames>((event, emit) async {
      await _loadGames(emit);
    });

    on<RefreshGames>((event, emit) async {
      await _loadGames(emit);
    });
  }

  Future<void> _loadGames(Emitter<GameState> emit) async {
    emit(GameLoading());
    try {
      final games = await fetchGames.execute();
      emit(GameLoaded(games));
    } catch (e) {
      emit(GameError("Не удалось загрузить игры"));
    }
  }
}