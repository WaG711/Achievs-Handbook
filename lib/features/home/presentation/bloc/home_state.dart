import '../../domain/entities/game_home.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<GameHome> games;
  HomeLoaded(this.games);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}