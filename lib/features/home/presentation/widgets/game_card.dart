import 'package:flutter/material.dart';

import '../../domain/entities/game_home.dart';

class GameCard extends StatelessWidget {
  final GameHome game;
  final VoidCallback onFavoriteToggle;

  const GameCard({super.key, required this.game, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shadowColor: Colors.green,
          color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
                    color: Colors.pink[100]),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Достижения: ${game.totalAchievements}',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  game.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 40,
              icon: Icon(
                game.isFavorite
                    ? Icons.bookmark_remove_rounded
                    : Icons.bookmark_border_rounded,
                color: Colors.green,
              ),
              onPressed: onFavoriteToggle,
            ),
          ],
        ),
      ],
    );
  }
}
