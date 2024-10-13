import 'achievement_guide_model_api.dart';

class GuideModelApi {
  final String guideId;
  final String description;
  final List<AchievementGuideModelApi> achievementsGuideApi;

  const GuideModelApi(
      {required this.guideId,
      required this.description,
      required this.achievementsGuideApi});

  factory GuideModelApi.fromJson(Map<String, dynamic> json) {
    return GuideModelApi(
        guideId: json['guideId'],
        description: json['description'],
        achievementsGuideApi: (json['achievements'] as List)
            .map((i) => AchievementGuideModelApi.fromJson(i))
            .toList());
  }
}
