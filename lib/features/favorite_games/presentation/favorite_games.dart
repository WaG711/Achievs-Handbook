import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/appbar_search.dart';
import '../../../core/widgets/custom_circular_progress_indicator.dart';
import 'bloc/favorite_games_bloc.dart';
import 'bloc/favorite_games_event.dart';
import 'bloc/favorite_games_state.dart';
import 'widgets/favorite_games_info.dart';

class FavoriteGames extends StatelessWidget {
  const FavoriteGames({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteGamesBloc>().add(LoadFavoriteGames());

    return PopScope(
      onPopInvokedWithResult: (canPop, result) {
        if (canPop) {
          context.read<FavoriteGamesBloc>().add(ClearFavoriteQuery());
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        appBar: AppbarSearch(
          onSearchChanged: (query) {
            context.read<FavoriteGamesBloc>().add(SearchFavoriteGames(query));
          },
        ),
        body: BlocBuilder<FavoriteGamesBloc, FavoriteGamesState>(
          builder: (context, state) {
            if (state is FavoriteGamesLoading) {
              return const Center(child: CustomCircularProgressIndicator());
            } else if (state is FavoriteGamesLoaded) {
              final games = state.games;
              return RefreshIndicator(
                backgroundColor: const Color.fromARGB(255, 35, 35, 35),
                onRefresh: () async {
                  context.read<FavoriteGamesBloc>().add(RefreshFavoriteGames());
                },
                color: Colors.green,
                child: FavoriteGamesInfo(games: games),
              );
            } else if (state is FavoriteGamesError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Нет доступных данных'));
          },
        ),
      ),
    );
  }
}
