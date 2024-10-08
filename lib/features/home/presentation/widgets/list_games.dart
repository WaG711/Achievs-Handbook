import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../favorite_games/presentation/bloc/favorite_games_bloc.dart';
import '../../../favorite_games/presentation/bloc/favorite_games_event.dart';
import '../../domain/entities/game_home.dart';
import 'game_card.dart';

class ListGames extends StatefulWidget {
  final List<GameHome> games;
  const ListGames({super.key, required this.games});

  @override
  State<ListGames> createState() => _ListGamesState();
}

class _ListGamesState extends State<ListGames> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(5),
      crossAxisCount: 2,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      itemCount: widget.games.length,
      itemBuilder: (context, index) {
        final game = widget.games[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/details', arguments: game.gameId);
          },
          child: GameCard(
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
