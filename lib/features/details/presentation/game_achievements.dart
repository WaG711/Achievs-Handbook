import 'package:flutter/material.dart';

import '../domain/entities/game2.dart';
import 'widgets/game_info.dart';

class GameAchievements extends StatelessWidget {
  final Game2 game;
  const GameAchievements({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      body: GameInfo(game: game),
    );
  }
}