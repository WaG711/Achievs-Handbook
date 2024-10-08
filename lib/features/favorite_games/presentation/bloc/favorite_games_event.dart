import '../../../abstract_entities/game_base.dart';

abstract class FavoriteGamesEvent {}

class LoadFavoriteGames extends FavoriteGamesEvent {
  LoadFavoriteGames();
}

class RefreshFavoriteGames extends FavoriteGamesEvent {
  RefreshFavoriteGames();
}

class SearchFavoriteGames extends FavoriteGamesEvent {
  final String query;

  SearchFavoriteGames(this.query);
}

class ClearFavoriteQuery extends FavoriteGamesEvent {
  ClearFavoriteQuery();
}

class ChangeStatusFavorite extends FavoriteGamesEvent {
  final GameBase gameBase;
  ChangeStatusFavorite(this.gameBase);
}