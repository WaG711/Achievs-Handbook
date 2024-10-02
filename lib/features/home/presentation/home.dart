import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_achievements/core/widgets/appbar_search.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'widgets/list_games.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      appBar: const AppbarSearch(isGameSearch: true),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            final games = state.games;
            return RefreshIndicator(
              backgroundColor: const Color.fromARGB(255, 35, 35, 35),
              onRefresh: () async {
                context.read<HomeBloc>().add(RefreshGames());
              },
              color: Colors.green,
              child: ListGames(games: games),
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Нет доступных данных'));
        },
      ),
    );
  }
}
