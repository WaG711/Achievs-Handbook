abstract class HomeEvent {}

class LoadGames extends HomeEvent {
  LoadGames();
}

class RefreshGames extends HomeEvent {
  RefreshGames();
}

class SearchGames extends HomeEvent {
  final String query;

  SearchGames(this.query);
}

class LoadFavoriteGames extends HomeEvent {
  LoadFavoriteGames();
}

class RefreshFavoriteGames extends HomeEvent {
  RefreshFavoriteGames();
}

class SearchFavoriteGames extends HomeEvent {
  final String query;

  SearchFavoriteGames(this.query);
}

class ClearFavoriteQuery extends HomeEvent {
  ClearFavoriteQuery();
}
