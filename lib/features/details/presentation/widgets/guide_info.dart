import 'package:flutter/material.dart';

import '../../domain/entities/game_details.dart';
import 'achievement_guide_container.dart';

class GuideInfo extends StatelessWidget {
  final GameDetails game;
  const GuideInfo({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Text(
                  'Руководство',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SelectableText(
                    game.guide.description,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
        game.guide.achievements.isEmpty
            ? const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Список пуст',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final achievement = game.guide.achievements[index];
                    return AchievementGuideContainer(achievement: achievement);
                  },
                  childCount: game.guide.achievements.length,
                ),
              )
      ],
    );
  }
}
