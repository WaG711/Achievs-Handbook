abstract class HomeEvent {}

class LoadGames extends HomeEvent {}

class RefreshGames extends HomeEvent {}

class SearchGames extends HomeEvent {
  final String query;

  SearchGames(this.query);
}
