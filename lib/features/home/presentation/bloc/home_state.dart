import '../../domain/entities/game.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Game> games;
  HomeLoaded(this.games);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}