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
