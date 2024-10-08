import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_achievements/features/favorite_games/presentation/bloc/favorite_games_event.dart';

import '../../../home/domain/entities/game_home.dart';
import '../bloc/favorite_games_bloc.dart';
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
    return widget.games.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Список пуст',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          )
        : ListView.builder(
            itemCount: widget.games.length,
            itemBuilder: (context, index) {
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
                      context.read<FavoriteGamesBloc>().add(ChangeStatusFavorite(game));
                    });
                  },
                ),
              );
            },
          );
  }
}
