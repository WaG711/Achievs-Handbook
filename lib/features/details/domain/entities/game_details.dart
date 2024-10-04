import 'achievement.dart';
import 'guide.dart';

class GameDetails {
  final String gameId;
  final String title;
  //final String posterUrl;
  final Guide guide;
  final List<Achievement> achievements;
  bool isFavorite;
  final int usersFavoritedCount;

  GameDetails(this.isFavorite,
      {required this.gameId,
      required this.title,
      //required this.posterUrl,
      required this.usersFavoritedCount,
      required this.guide,
      required this.achievements});
}