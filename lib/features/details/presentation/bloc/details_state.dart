import '../../domain/entities/game_details.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final GameDetails game;
  DetailsLoaded(this.game);
}

class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}