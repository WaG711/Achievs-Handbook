import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
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
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                child: CachedNetworkImage(
                  imageUrl: game.posterUrl,
                  width: double.infinity,
                  height: 300,
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
                    child: const Icon(Icons.image_not_supported,
                        color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 2.0),
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
