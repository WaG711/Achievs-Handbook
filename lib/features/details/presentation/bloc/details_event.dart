abstract class DetailsEvent {}

class LoadGame extends DetailsEvent {
  final String gameId;

  LoadGame(this.gameId);
}