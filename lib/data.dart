import 'package:guide_achievements/features/home/domain/entities/game_home.dart';

import 'features/details/domain/entities/achievement.dart';
import 'features/details/domain/entities/achievement_guide.dart';
import 'features/details/domain/entities/game_details.dart';
import 'features/details/domain/entities/guide.dart';

class Data {
  static List<GameHome> allGames = [
    GameHome(
        gameId: '1',
        title: 'Spider-Man: Miles Morales',
        posterUrl:
            'https://i.pinimg.com/736x/6f/82/e9/6f82e91456b8b61e0a5af45402031358.jpg',
        totalAchievements: 24,
        isFavorite: true),
    GameHome(
        gameId: '2',
        title: 'Hogwarts Legacy',
        posterUrl:
            'https://avatars.mds.yandex.net/get-mpic/12626365/2a0000018f04643a5c5eefbe55f8f037c3ba/orig',
        totalAchievements: 54,
        isFavorite: false),
    GameHome(
        gameId: '3',
        title: 'The Evil Within',
        posterUrl:
            'https://avatars.mds.yandex.net/i?id=f5b844761372354e3c152c1c1b1fe738_l-5337299-images-thumbs&n=13',
        totalAchievements: 43,
        isFavorite: false),
    GameHome(
        gameId: '4',
        title: 'Game 4',
        posterUrl:
            'https://avatars.mds.yandex.net/get-mpic/5320264/img_id7503544954759306288.jpeg/orig',
        totalAchievements: 123,
        isFavorite: false),
    GameHome(
        gameId: '5',
        title: 'Game 5',
        posterUrl:
            'https://i.pinimg.com/736x/7e/68/4b/7e684bab5586ad74b7900f08ebb20cea--nerd-geek-nyc.jpg',
        totalAchievements: 87,
        isFavorite: true),
    GameHome(
        gameId: '6',
        title: 'Game 6',
        posterUrl: 'https://cdn1.ozone.ru/s3/multimedia-a/6389139382.jpg',
        totalAchievements: 67,
        isFavorite: false),
    GameHome(
        gameId: '7',
        title: 'Game 7',
        posterUrl:
            'https://avatars.mds.yandex.net/get-mpic/10815509/2a0000018b434a6b0e5d5314c46b21d1e4d4/orig',
        totalAchievements: 756,
        isFavorite: false),
    GameHome(
        gameId: '8',
        title: 'Game 8',
        posterUrl:
            'https://speed-new.com/wp-content/uploads/2015/02/454363566.jpg',
        totalAchievements: 234,
        isFavorite: false),
    GameHome(
        gameId: '9',
        title: 'Game 9',
        posterUrl:
            'https://i.pinimg.com/736x/72/0d/a1/720da192ce783efb044a1922bb4273f4--clean-slate-sony.jpg',
        totalAchievements: 34,
        isFavorite: false),
  ];

  static GameDetails game = GameDetails(
      gameId: '1',
      title: 'Hogwarts Legacy',
      posterUrl:
          'https://avatars.mds.yandex.net/get-mpic/12626365/2a0000018f04643a5c5eefbe55f8f037c3ba/orig',
      guide: const Guide(
          guideId: '1',
          description: 'sdfgsdgsd sdg gs gsd gsd hsd hds hfsdf ',
          achievements: [
            AchievementGuide(
                achievementId: '1',
                title: 'title1',
                description:
                    'description description description description description description description description',
                posterUrl:
                    'https://img.goodfon.ru/original/2736x1824/8/d3/zakat-nebo-solnce-luchi-oblaka.jpg',
                screenshotsUrls: []),
            AchievementGuide(
                achievementId: '2',
                title: 'title2',
                description: 'description',
                posterUrl:
                    'https://www.zastavki.com/pictures/originals/2014/Nature___Seasons___Spring_Cold_river_in_spring_067776_.jpg',
                screenshotsUrls: [
                  'https://avatars.mds.yandex.net/i?id=4f7586d49edaa427e07a8819562fc284_l-5248434-images-thumbs&n=13',
                  'https://puzzleit.ru/files/puzzles/191/190930/_original.jpg',
                  'https://fresco.wallset.ru/images/detailed/1208/3086.jpg',
                  'https://s1.1zoom.me/big3/652/342768-sepik.jpg',
                  'https://images.wallpaperscraft.com/image/single/lake_mountain_tree_36589_2650x1600.jpg'
                ]),
          ]),
      achievements: [
        const Achievement(
            achievementId: '1',
            title: 'title1',
            posterUrl:
                'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg',
            description:
                'description description description description description description description description'),
        const Achievement(
            achievementId: '2',
            title: 'title2',
            posterUrl:
                'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg',
            description: 'description'),
        const Achievement(
            achievementId: '3',
            title: 'title3',
            posterUrl:
                'https://i.pinimg.com/originals/24/ac/ef/24acef8b3a6a45d7239480bcc4ff0193.jpg',
            description: 'description'),
      ],
      isFavorite: false);
}
