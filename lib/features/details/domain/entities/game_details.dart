import '../../../../core/abstract_entities/game_base.dart';
import 'achievement.dart';
import 'guide.dart';

class GameDetails extends GameBase {
  final String title;
  //final String posterUrl;
  final Guide guide;
  final List<Achievement> achievements;

  GameDetails(
      {required super.gameId,
      required this.title,
      //required this.posterUrl,
      required this.guide,
      required this.achievements,
      required super.isFavorite});

  GameDetails copyWith({
    List<Achievement>? achievements,
  }) {
    return GameDetails(
        gameId: gameId,
        title: title,
        guide: guide,
        achievements: achievements ?? this.achievements,
        isFavorite: isFavorite);
  }
}
