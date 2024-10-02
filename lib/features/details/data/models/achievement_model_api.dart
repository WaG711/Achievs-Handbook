class AchievementModelApi {
  final String achievementId;
  final String title;
  final String description;
  final String posterUrl;

  const AchievementModelApi(
      {required this.achievementId,
      required this.title,
      required this.description,
      required this.posterUrl});

  factory AchievementModelApi.fromJson(Map<String, dynamic> json) {
    return AchievementModelApi(
        achievementId: json['achievementId'],
        title: json['title'],
        description: json['description'],
        posterUrl: json['posterUrl']);
  }
}
