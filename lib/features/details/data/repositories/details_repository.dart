import 'package:guide_achievements/features/details/data/models/achievement_model_api.dart';
import 'package:guide_achievements/features/details/data/models/game_details_model_api.dart';
import 'package:guide_achievements/features/details/data/models/guide_model_api.dart';

import '../../../../data.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/achievement_guide.dart';
import '../../domain/entities/game_details.dart';
import '../../domain/entities/guide.dart';
import '../api/details_api.dart';
import '../models/achievement_guide_model_api.dart';

class DetailsRepository {
  final DetailsApi _gameApi;

  DetailsRepository(this._gameApi);

  Future<GameDetails> getGame(String userId, String gameId) async {
    // final gameModel = await _gameApi.fetchGame(gameId);
    // return _mapGameModelApiToGame(gameModel);
    return Data.game;
  }

  GameDetails _mapGameModelApiToGame(GameDetailsModelApi gameModelApi) {
    return GameDetails(
      gameId: gameModelApi.gameId,
      title: gameModelApi.title,
      posterUrl: gameModelApi.posterUrl,
      guide: _mapGuideModelApiToGuide(gameModelApi.guideApi),
      achievements: gameModelApi.achievementsApi
          .map((a) => _mapAchievementModelApiToAchievement(a))
          .toList(),
      isFavorite: gameModelApi.isFavorite,
    );
  }

  Guide _mapGuideModelApiToGuide(GuideModelApi guideModelApi) {
    return Guide(
      guideId: guideModelApi.guideId,
      description: guideModelApi.description,
      achievements: guideModelApi.achievementsGuideApi
          .map((a) => _mapAchievementGuideModelApiToAchievement(a))
          .toList(),
    );
  }

  AchievementGuide _mapAchievementGuideModelApiToAchievement(AchievementGuideModelApi achievementGuideModelApi) {
    return AchievementGuide(
        achievementId: achievementGuideModelApi.achievementId,
        title: achievementGuideModelApi.title,
        description: achievementGuideModelApi.description,
        posterUrl: achievementGuideModelApi.posterUrl,
        screenshotsUrls: achievementGuideModelApi.screenshotsUrls);
  }

  Achievement _mapAchievementModelApiToAchievement(AchievementModelApi achievementModelApi) {
    return Achievement(
      achievementId: achievementModelApi.achievementId,
      title: achievementModelApi.title,
      description: achievementModelApi.description,
      posterUrl: achievementModelApi.posterUrl,
    );
  }
}
