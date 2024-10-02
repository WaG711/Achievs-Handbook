import 'achievement.dart';

class Guide {
  final String guideId;
  final String description;
  final List<Achievement> achievements;

  const Guide(
      {required this.guideId,
      required this.description,
      required this.achievements});
}