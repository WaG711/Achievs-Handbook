class GameModelApi {
  final String gameId;
  final String title;
  final String posterUrl;
  final bool isFavorite;
  final int totalAchievements;

  const GameModelApi(
      {required this.gameId,
      required this.title,
      required this.posterUrl,
      required this.isFavorite,
      required this.totalAchievements});

  factory GameModelApi.fromJson(Map<String, dynamic> json) {
    return GameModelApi(
        gameId: json['gameId'],
        title: json['title'],
        posterUrl: json['posterUrl'],
        isFavorite: json['isFavorite'],
        totalAchievements: json['totalAchievements']);
  }
}
