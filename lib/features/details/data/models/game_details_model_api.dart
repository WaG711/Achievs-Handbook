import 'achievement_model_api.dart';
import 'guide_model_api.dart';

class GameDetailsModelApi {
  final String gameId;
  final String title;
  final String posterUrl;
  final GuideModelApi guideApi;
  final List<AchievementModelApi> achievementsApi;
  final bool isFavorite;
  final int usersFavoritedCount;

  const GameDetailsModelApi(
      {required this.gameId,
      required this.title,
      required this.posterUrl,
      required this.isFavorite,
      required this.usersFavoritedCount,
      required this.guideApi,
      required this.achievementsApi});

  factory GameDetailsModelApi.fromJson(Map<String, dynamic> json) {
    return GameDetailsModelApi(
        gameId: json['gameId'],
        title: json['title'],
        posterUrl: json['posterUrl'],
        isFavorite: json['isFavorite'],
        usersFavoritedCount: json['usersFavoritedCount'],
        guideApi: GuideModelApi.fromJson(json['guide']),
        achievementsApi: (json['achievements'] as List)
            .map((i) => AchievementModelApi.fromJson(i))
            .toList());
  }
}
