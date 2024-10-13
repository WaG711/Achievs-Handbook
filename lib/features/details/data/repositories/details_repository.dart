import 'package:guide_achievements/features/details/data/models/achievement_model_api.dart';
import 'package:guide_achievements/features/details/data/models/game_details_model_api.dart';
import 'package:guide_achievements/features/details/data/models/guide_model_api.dart';

import '../../domain/entities/achievement.dart';
import '../../domain/entities/achievement_guide.dart';
import '../../domain/entities/game_details.dart';
import '../../domain/entities/guide.dart';
import '../api/details_api.dart';
import '../models/achievement_guide_model_api.dart';

class DetailsRepository {
  final DetailsApi _gameApi;

  DetailsRepository(this._gameApi);

  final GameDetails _game = GameDetails(
      gameId: '1',
      title: 'dghdgdgfdgdg',
      posterUrl: 'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg',
      guide: const Guide(
          guideId: '1',
          description: 'sdfgsdgsd sdg gs gsd gsd hsd hds hfsdf ',
          achievements: [
            AchievementGuide(
                achievementId: '1',
                title: 'title1',
                description: 'description description description description description description description description',
                posterUrl: 'https://img.goodfon.ru/original/2736x1824/8/d3/zakat-nebo-solnce-luchi-oblaka.jpg',
                screenshotsUrls: []),
            AchievementGuide(
                achievementId: '2',
                title: 'title2',
                description: 'description',
                posterUrl: 'https://www.zastavki.com/pictures/originals/2014/Nature___Seasons___Spring_Cold_river_in_spring_067776_.jpg',
                screenshotsUrls: ['https://avatars.mds.yandex.net/i?id=4f7586d49edaa427e07a8819562fc284_l-5248434-images-thumbs&n=13', 'https://puzzleit.ru/files/puzzles/191/190930/_original.jpg', 'https://fresco.wallset.ru/images/detailed/1208/3086.jpg', 'https://s1.1zoom.me/big3/652/342768-sepik.jpg', 'https://images.wallpaperscraft.com/image/single/lake_mountain_tree_36589_2650x1600.jpg']),
          ]),
      achievements: [
        const Achievement(
            achievementId: '1',
            title: 'title1',
            posterUrl: 'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg',
            description: 'description description description description description description description description'),
        const Achievement(
            achievementId: '2', title: 'title2', posterUrl: 'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg', description: 'description'),
        const Achievement(
            achievementId: '3', title: 'title3', posterUrl: 'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg', description: 'description'),
      ],
      isFavorite: false);

  Future<GameDetails> getGame(String userId, String gameId) async {
    // final gameModel = await _gameApi.fetchGame(gameId);
    // return _mapGameModelApiToGame(gameModel);
    return _game;
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
