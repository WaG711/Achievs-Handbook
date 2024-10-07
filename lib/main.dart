import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentification/data/api/login_api.dart';
import 'features/authentification/data/api/register_api.dart';
import 'features/authentification/data/repositories/login_repository.dart';
import 'features/authentification/data/repositories/register_repository.dart';
import 'features/authentification/domain/usecases/login_usecase.dart';
import 'features/authentification/domain/usecases/register_usecase.dart';
import 'features/authentification/presentation/authentification_check.dart';
import 'features/authentification/presentation/bloc/authentification_bloc.dart';
import 'features/authentification/presentation/login.dart';
import 'features/authentification/presentation/register.dart';
import 'features/details/data/api/details_api.dart';
import 'features/details/data/repositories/details_repository.dart';
import 'features/details/domain/usecases/details_usecase.dart';
import 'features/details/presentation/bloc/details_bloc.dart';
import 'features/details/presentation/details.dart';
import 'features/home/data/api/home_api.dart';
import 'features/home/data/repositories/home_repository.dart';
import 'features/home/domain/usecases/home_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/favorite_games.dart';
import 'features/home/presentation/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthentificationBloc>(
          create: (context) {
            final loginApi = LoginApi(dio);
            final loginRepository = LoginRepository(loginApi);
            final loginUseCase = LoginUseCase(loginRepository);

            final registerApi = RegisterApi(dio);
            final registerRepository = RegisterRepository(registerApi);
            final registerUseCase = RegisterUseCase(registerRepository);

            return AuthentificationBloc(loginUseCase, registerUseCase);
          },
        ),
        BlocProvider<HomeBloc>(
          create: (context) {
            final homeApi = HomeApi(dio);
            final repository = HomeRepository(homeApi);
            final homeUseCase = HomeUseCase(repository);
            final userId = context.read<AuthentificationBloc>().userId;
            return HomeBloc(homeUseCase, userId);
          },
        ),
        BlocProvider<DetailsBloc>(create: (context) {
          final detailsApi = DetailsApi(dio);
          final repository = DetailsRepository(detailsApi);
          final detailsUseCase = DetailsUseCase(repository);
          final userId = context.read<AuthentificationBloc>().userId;
          return DetailsBloc(detailsUseCase, userId);
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const AuthentificationCheck(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/home': (context) => const Home(),
          '/favoriteGames': (context) => const FavoriteGames(),
          '/details': (context) => const Details()
        },
      ),
    );
  }
}
