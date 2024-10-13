import 'achievement_guide.dart';

class Guide {
  final String guideId;
  final String description;
  final List<AchievementGuide> achievements;

  const Guide(
      {required this.guideId,
      required this.description,
      required this.achievements});
}
