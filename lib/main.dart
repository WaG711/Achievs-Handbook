import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/details/data/api/game2_api.dart';
import 'features/details/data/repositories/game2_repository.dart';
import 'features/details/domain/usecases/fetch_game.dart';
import 'features/details/presentation/bloc/details_bloc.dart';
import 'features/details/presentation/details.dart';
import 'features/home/data/api/game_api.dart';
import 'features/home/data/repositories/game_repository.dart';
import 'features/home/domain/usecases/fetch_games.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_event.dart';
import 'features/home/presentation/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) {
            final dio = Dio();
            final dataSource = GameApi(dio);
            final repository = GameRepository(dataSource);
            final fetchGames = FetchGames(repository);
            final homeBloc = HomeBloc(fetchGames);
            homeBloc.add(LoadGames());
            return homeBloc;
          },
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const Home(),
          '/details': (context) => BlocProvider(
                create: (context) {
                  final dio = Dio();
                  final dataSource = Game2Api(dio);
                  final repository = Game2Repository(dataSource);
                  final fetchGame = FetchGame(repository);
                  return DetailsBloc(fetchGame);
                },
                child: const Details(),
              ),
        },
      ),
    );
  }
}
