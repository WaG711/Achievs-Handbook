import 'achievement_model_api.dart';

class GuideModelApi {
  final String guideId;
  final String description;
  final List<AchievementModelApi> achievementsApi;

  const GuideModelApi(
      {required this.guideId,
      required this.description,
      required this.achievementsApi});

  factory GuideModelApi.fromJson(Map<String, dynamic> json) {
    return GuideModelApi(
        guideId: json['guideId'],
        description: json['description'],
        achievementsApi: (json['achievements'] as List)
            .map((i) => AchievementModelApi.fromJson(i))
            .toList());
  }
}
