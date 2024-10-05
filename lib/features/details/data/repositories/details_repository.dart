import 'package:guide_achievements/features/details/data/models/achievement_model_api.dart';
import 'package:guide_achievements/features/details/data/models/game_details_model_api.dart';
import 'package:guide_achievements/features/details/data/models/guide_model_api.dart';

import '../../domain/entities/achievement.dart';
import '../../domain/entities/game_details.dart';
import '../../domain/entities/guide.dart';
import '../api/details_api.dart';

class DetailsRepository {
  final DetailsApi _gameApi;

  DetailsRepository(this._gameApi);

  final GameDetails _game = GameDetails(false,
      gameId: '1',
      title: 'dghdgdgfdgdg',
      guide: const Guide(
          guideId: '1',
          description: 'sdfgsdgsd sdg gs gsd gsd hsd hds hfsdf ',
          achievements: [
            Achievement(
                achievementId: '1', title: 'title1', description: 'description'),
            Achievement(
                achievementId: '2', title: 'title2', description: 'description'),
          ]),
      achievements: [
        const Achievement(
            achievementId: '1', title: 'title1', description: 'description'),
        const Achievement(
            achievementId: '2', title: 'title2', description: 'description'),
        const Achievement(
            achievementId: '3', title: 'title3', description: 'description'),
      ]);

  Future<GameDetails> getGame(String gameId) async {
    // final gameModel = await _gameApi.fetchGame(gameId);
    // return _mapGameModelApiToGame(gameModel);
    return _game;
  }

  GameDetails _mapGameModelApiToGame(GameDetailsModelApi gameModelApi) {
    return GameDetails(
      gameModelApi.isFavorite,
      gameId: gameModelApi.gameId,
      title: gameModelApi.title,
      //posterUrl: gameModelApi.posterUrl,
      guide: _mapGuideModelApiToGuide(gameModelApi.guideApi),
      achievements: gameModelApi.achievementsApi
          .map((a) => _mapAchievementModelApiToAchievement(a))
          .toList(),
    );
  }

  Guide _mapGuideModelApiToGuide(GuideModelApi guideModelApi) {
    return Guide(
      guideId: guideModelApi.guideId,
      description: guideModelApi.description,
      achievements: guideModelApi.achievementsApi
          .map((a) => _mapAchievementModelApiToAchievement(a))
          .toList(),
    );
  }

  Achievement _mapAchievementModelApiToAchievement(
      AchievementModelApi achievementModelApi) {
    return Achievement(
      achievementId: achievementModelApi.achievementId,
      title: achievementModelApi.title,
      description: achievementModelApi.description,
      //posterUrl: achievementModelApi.posterUrl,
    );
  }
}
