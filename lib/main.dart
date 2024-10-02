import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/data/api/game_api.dart';
import 'features/home/data/repositories/game_repository.dart';
import 'features/home/domain/usecases/fetch_games.dart';
import 'features/home/presentation/bloc/game_bloc.dart';
import 'features/home/presentation/bloc/game_event.dart';
import 'features/home/presentation/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) {
        final dio = Dio();
        final dataSource = GameApi(dio);
        final repository = GameRepository(dataSource);
        final fetchGames = FetchGames(repository);
        final bloc = GameBloc(fetchGames);
        bloc.add(LoadGames());
        return bloc;
      },
      child: const Home(),
    ));
  }
}
