class Game {
  final String gameId;
  final String title;
  //final String posterUrl;
  bool isFavorite;
  final int totalAchievements;

  Game(this.isFavorite,
      {required this.gameId,
      required this.title,
      required this.totalAchievements});
}
