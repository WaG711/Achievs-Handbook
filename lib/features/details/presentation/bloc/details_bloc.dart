import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/details_usecase.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsUseCase fetchGame;

  DetailsBloc(this.fetchGame) : super(DetailsInitial()) {
    on<LoadGame>((event, emit) async {
      await _loadGame(event.gameId, emit);
    });
  }

  Future<void> _loadGame(String gameId, Emitter<DetailsState> emit) async {
    emit(DetailsLoading());
    try {
      final game = await fetchGame.execute(gameId);
      emit(DetailsLoaded(game));
    } catch (e) {
      emit(DetailsError("Не удалось загрузить игры"));
    }
  }
}