import 'package:flutter/material.dart';

import '../../../home/domain/entities/game_home.dart';

class FavoriteCard extends StatelessWidget {
  final GameHome game;
  final VoidCallback onFavoriteToggle;
  const FavoriteCard({super.key, required this.game, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 2,
      color: const Color.fromARGB(255, 45, 45, 45),
      shadowColor: const Color.fromARGB(255, 45, 45, 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Container(
          width: 115,
          height: 150,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(5)),
            color: Colors.pink[200],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
            child: Column(
              children: [
                Text(
                  game.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'Достижения: ${game.totalAchievements}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(5.0)),
            color: Colors.green,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 40,
            icon: Icon(
              game.isFavorite
                  ? Icons.bookmark_remove_rounded
                  : Icons.bookmark_border_rounded,
              color: Colors.white,
            ),
            onPressed: onFavoriteToggle,
          ),
        ),
      ]),
    );
  }
}
