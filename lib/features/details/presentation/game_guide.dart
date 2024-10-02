import 'package:flutter/material.dart';

import '../domain/entities/game2.dart';
import 'widgets/guide_info.dart';

class GameGuide extends StatelessWidget {
  final Game2 game;
  const GameGuide({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      body: GuideInfo(game: game),
    );
  }
}