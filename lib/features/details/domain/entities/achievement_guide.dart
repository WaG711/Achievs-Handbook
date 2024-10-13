class AchievementGuide {
  final String achievementId;
  final String title;
  final String description;
  final String posterUrl;
  final List<String> screenshotsUrls;

  const AchievementGuide(
      {required this.achievementId,
      required this.title,
      required this.description,
      required this.posterUrl,
      required this.screenshotsUrls});
}
