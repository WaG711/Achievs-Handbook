import 'package:flutter/material.dart';

import '../../../home/domain/entities/game_home.dart';
import 'favorite_games_container.dart';

class FavoriteGamesInfo extends StatefulWidget {
  final List<GameHome> games;
  const FavoriteGamesInfo({super.key, required this.games});

  @override
  State<FavoriteGamesInfo> createState() => _FavoriteGamesInfoState();
}

class _FavoriteGamesInfoState extends State<FavoriteGamesInfo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Избранное',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final game = widget.games[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/details',
                      arguments: game.gameId);
                },
                child: FavoriteGamesContainer(
                  game: game,
                  onFavoriteToggle: () {
                    setState(() {
                      game.isFavorite = !game.isFavorite;
                    });
                  },
                ),
              );
            },
            childCount: widget.games.length,
          ),
        ),
      ],
    );
  }
}
