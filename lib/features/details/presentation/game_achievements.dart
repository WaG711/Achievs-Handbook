import 'package:flutter/material.dart';

import '../domain/entities/game_details.dart';
import 'widgets/game_info.dart';

class GameAchievements extends StatelessWidget {
  final String userId;
  final GameDetails game;
  const GameAchievements({super.key, required this.userId, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      body: GameInfo(userId: userId, game: game,),
    );
  }
}
