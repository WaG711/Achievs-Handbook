abstract class DetailsEvent {}

class LoadGame extends DetailsEvent {
  final String gameId;

  LoadGame(this.gameId);
}

class SearchAchievements extends DetailsEvent {
  final String gameId;
  final String query;

  SearchAchievements(this.gameId, this.query,);
}
