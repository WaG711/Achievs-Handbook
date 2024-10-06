abstract class HomeEvent {}

class LoadGames extends HomeEvent {
  String userId;

  LoadGames(this.userId);
}

class RefreshGames extends HomeEvent {
  String userId;

  RefreshGames(this.userId);
}

class SearchGames extends HomeEvent {
  final String userId;
  final String query;

  SearchGames(this.userId, this.query);
}
