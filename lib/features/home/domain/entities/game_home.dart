import '../../../../core/abstract_entities/game_base.dart';

class GameHome extends GameBase {
  final String title;
  final String posterUrl;
  final int totalAchievements;

  GameHome(
      {required super.gameId,
      required this.title,
      required this.posterUrl,
      required this.totalAchievements,
      required super.isFavorite});
}
