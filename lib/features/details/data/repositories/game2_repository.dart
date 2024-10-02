import 'package:guide_achievements/features/details/data/models/achievement_model_api.dart';
import 'package:guide_achievements/features/details/data/models/game2_model_api.dart';
import 'package:guide_achievements/features/details/data/models/guide_model_api.dart';

import '../../domain/entities/achievement.dart';
import '../../domain/entities/game2.dart';
import '../../domain/entities/guide.dart';
import '../api/game2_api.dart';

class Game2Repository {
  final Game2Api _gameApi;

  Game2Repository(this._gameApi);

  final Game2 _game = Game2(false,
      gameId: '1',
      title: 'dghdgdgfdgdg',
      usersFavoritedCount: 34,
      guide: const Guide(
          guideId: '1',
          description: 'sdfgsdgsd sdg gs gsd gsd hsd hds hfsdf ',
          achievements: [
            Achievement(
                achievementId: '1', title: 'title', description: 'description'),
            Achievement(
                achievementId: '2', title: 'title', description: 'description'),
          ]),
      achievements: [
        const Achievement(
            achievementId: '1', title: 'title', description: 'description'),
        const Achievement(
            achievementId: '2', title: 'title', description: 'description'),
        const Achievement(
            achievementId: '3', title: 'title', description: 'description'),
      ]);

  Future<Game2> getGame(String gameId) async {
    // final gameModel = await _gameApi.fetchGame(gameId);
    // return _mapGameModelApiToGame(gameModel);
    return _game;
  }

  Game2 _mapGameModelApiToGame(Game2ModelApi gameModelApi) {
    return Game2(
      gameModelApi.isFavorite,
      gameId: gameModelApi.gameId,
      title: gameModelApi.title,
      //posterUrl: gameModelApi.posterUrl,
      guide: _mapGuideModelApiToGuide(gameModelApi.guideApi),
      achievements: gameModelApi.achievementsApi
          .map((a) => _mapAchievementModelApiToAchievement(a))
          .toList(),
      usersFavoritedCount: gameModelApi.usersFavoritedCount,
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
