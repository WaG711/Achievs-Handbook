import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
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
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: CachedNetworkImage(
            imageUrl: game.posterUrl,
            width: 115,
            height: 150,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              child: const CustomCircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'Достижения: ${game.totalAchievements}',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
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
