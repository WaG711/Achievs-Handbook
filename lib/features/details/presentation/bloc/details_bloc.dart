import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/details_usecase.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsUseCase fetchGame;

  DetailsBloc(this.fetchGame) : super(DetailsInitial()) {
    on<LoadGame>((event, emit) async {
      emit(DetailsLoading());
      try {
        final game = await fetchGame.execute(event.userId, event.gameId);
        emit(DetailsLoaded(game));
      } catch (e) {
        emit(DetailsError("Не удалось загрузить данные об игре"));
      }
    });

    on<SearchAchievements>((event, emit) async {
      if (state is DetailsLoaded) {
        try {
          final game = await fetchGame.execute(event.userId, event.gameId);

          final filteredAchievements = game.achievements
              .where((achievement) => achievement.title
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
              .toList();

          final filteredGame = game.copyWith(achievements: filteredAchievements);
          emit(DetailsLoaded(filteredGame));
        } catch (e) {
          emit(DetailsError("Не удалось загрузить данные об игре"));
        }
      }
    });
  }
}
