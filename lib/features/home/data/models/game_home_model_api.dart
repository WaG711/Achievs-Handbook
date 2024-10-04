class GameHomeModelApi {
  final String gameId;
  final String title;
  final String posterUrl;
  final bool isFavorite;
  final int totalAchievements;

  const GameHomeModelApi(
      {required this.gameId,
      required this.title,
      required this.posterUrl,
      required this.isFavorite,
      required this.totalAchievements});

  factory GameHomeModelApi.fromJson(Map<String, dynamic> json) {
    return GameHomeModelApi(
        gameId: json['gameId'],
        title: json['title'],
        posterUrl: json['posterUrl'],
        isFavorite: json['isFavorite'],
        totalAchievements: json['totalAchievements']);
  }
}
