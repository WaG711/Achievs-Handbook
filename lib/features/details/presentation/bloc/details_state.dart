import '../../domain/entities/game2.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final Game2 game;
  DetailsLoaded(this.game);
}

class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}