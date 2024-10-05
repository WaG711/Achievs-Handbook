import 'achievement.dart';
import 'guide.dart';

class GameDetails {
  final String gameId;
  final String title;
  //final String posterUrl;
  final Guide guide;
  final List<Achievement> achievements;
  bool isFavorite;

  GameDetails(this.isFavorite,
      {required this.gameId,
      required this.title,
      //required this.posterUrl,
      required this.guide,
      required this.achievements});

  GameDetails copyWith({
    List<Achievement>? achievements,
  }) {
    return GameDetails(isFavorite,
        gameId: gameId,
        title: title,
        guide: guide,
        achievements: achievements ?? this.achievements);
  }
}
