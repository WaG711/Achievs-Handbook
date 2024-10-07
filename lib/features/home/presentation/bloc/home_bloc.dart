import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;
  final String userId;
  String? _homeQuery;
  String? _favoriteQuery;

  HomeBloc(this.homeUseCase, this.userId) : super(HomeInitial()) {
    on<LoadGames>((event, emit) async {
      emit(HomeLoading());
      try {
        final games = await homeUseCase.execute(userId);
        emit(HomeLoaded(games));
      } catch (e) {
        emit(HomeError("Не удалось загрузить игры"));
      }
    });

    on<RefreshGames>((event, emit) async {
      await _loadGames(emit);
    });

    on<SearchGames>((event, emit) async {
      _homeQuery = event.query;
      await _loadGames(emit);
    });

    on<LoadFavoriteGames>((event, emit) async {
      emit(HomeLoading());
      try {
        final games = await homeUseCase.executeFavorite(userId);
        emit(HomeLoaded(games));
      } catch (e) {
        emit(HomeError("Не удалось загрузить игры"));
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
  }

  Future<void> _loadGames(Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final games = await homeUseCase.execute(userId);

      final filteredGames = _homeQuery != null
          ? games
              .where((game) =>
                  game.title.toLowerCase().contains(_homeQuery!.toLowerCase()))
              .toList()
          : games;

      emit(HomeLoaded(filteredGames));
    } catch (e) {
      emit(HomeError("Не удалось загрузить игры"));
    }
  }

  Future<void> _loadFavoriteGames(Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final games = await homeUseCase.executeFavorite(userId);

      final filteredGames = _favoriteQuery != null
          ? games
              .where((game) => game.title
                  .toLowerCase()
                  .contains(_favoriteQuery!.toLowerCase()))
              .toList()
          : games;

      emit(HomeLoaded(filteredGames));
    } catch (e) {
      emit(HomeError("Не удалось загрузить игры"));
    }
  }
}
