import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/favorite_games_usecase.dart';
import 'favorite_games_event.dart';
import 'favorite_games_state.dart';

class FavoriteGamesBloc extends Bloc<FavoriteGamesEvent, FavoriteGamesState> {
  final FavoriteGamesUseCase favoriteGamesUseCase;
  final String userId;
  String? _favoriteQuery;

  FavoriteGamesBloc(this.favoriteGamesUseCase, this.userId): super(FavoriteGamesInitial()) {
    on<LoadFavoriteGames>((event, emit) async {
      emit(FavoriteGamesLoading());
      try {
        final games = await favoriteGamesUseCase.executeFavorite(userId);
        emit(FavoriteGamesLoaded(games));
      } catch (e) {
        emit(FavoriteGamesError('Не удалось загрузить игры'));
      }
    });

    on<RefreshFavoriteGames>((event, emit) async {
      await _loadFavoriteGames(emit);
    });

    on<SearchFavoriteGames>((event, emit) async {
      _favoriteQuery = event.query;
      await _loadFavoriteGames(emit);
    });

    on<ClearFavoriteQuery>((event, emit) async {
      _favoriteQuery = null;
    });

    on<ChangeStatusFavorite>((event, emit) async {
      try {
        if (event.gameBase.isFavorite) {
          await favoriteGamesUseCase.removeFavorites(userId);
        } else {
          await favoriteGamesUseCase.addFavorites(userId);
        }
        event.gameBase.isFavorite = !event.gameBase.isFavorite;
        
        final games = await favoriteGamesUseCase.executeFavorite(userId);
        emit(FavoriteGamesLoaded(games));
      } catch (e) {
        emit(ChangeStatusFavoriteFailed('Не удалось изменить статус избранного'));
      }
    });
  }

  Future<void> _loadFavoriteGames(Emitter<FavoriteGamesState> emit) async {
    emit(FavoriteGamesLoading());
    try {
      final games = await favoriteGamesUseCase.executeFavorite(userId);

      final filteredGames = _favoriteQuery != null
          ? games
              .where((game) => game.title
                  .toLowerCase()
                  .contains(_favoriteQuery!.toLowerCase()))
              .toList()
          : games;

      emit(FavoriteGamesLoaded(filteredGames));
    } catch (e) {
      emit(FavoriteGamesError('Не удалось загрузить игры'));
    }
  }
}
