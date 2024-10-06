abstract class DetailsEvent {}

class LoadGame extends DetailsEvent {
  final String userId;
  final String gameId;

  LoadGame(this.userId, this.gameId);
}

class SearchAchievements extends DetailsEvent {
  final String userId;
  final String gameId;
  final String query;

  SearchAchievements(this.userId, this.gameId, this.query,);
}
