class AchievementGuideModelApi {
  final String achievementId;
  final String title;
  final String description;
  final String posterUrl;
  final List<String> screenshotsUrls;

  const AchievementGuideModelApi( 
      {required this.achievementId,
      required this.title,
      required this.description,
      required this.posterUrl,
      required this.screenshotsUrls});

  factory AchievementGuideModelApi.fromJson(Map<String, dynamic> json) {
    return AchievementGuideModelApi(
      achievementId: json['achievementId'],
        title: json['title'],
        description: json['description'],
        posterUrl: json['posterUrl'],
        screenshotsUrls: List<String>.from(json['screenshotsUrls']));
  }
}
