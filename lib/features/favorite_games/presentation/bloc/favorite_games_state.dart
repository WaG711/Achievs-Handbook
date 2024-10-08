import '../../../home/domain/entities/game_home.dart';

abstract class FavoriteGamesState {}

class FavoriteGamesInitial extends FavoriteGamesState {}

class FavoriteGamesLoading extends FavoriteGamesState {}

class FavoriteGamesLoaded extends FavoriteGamesState {
  final List<GameHome> games;
  FavoriteGamesLoaded(this.games);
}

class FavoriteGamesError extends FavoriteGamesState {
  final String message;
  FavoriteGamesError(this.message);
}

class ChangeStatusFavoriteFailed extends FavoriteGamesState {
  final String message;
  ChangeStatusFavoriteFailed(this.message);
}