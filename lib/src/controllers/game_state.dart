import 'package:equatable/equatable.dart';

import '../models/puzzle.dart';

enum GameStatus {
  created,
  playing,
  solved,
}

class GameState extends Equatable {
  const GameState({
    required this.crossAxisCount,
    required this.puzzle,
    required this.solved,
    required this.moves,
    required this.status,
  });

  final int crossAxisCount;
  final Puzzle puzzle;
  final bool solved;
  final int moves;
  final GameStatus status;

  GameState copyWith({
    int? crossAxisCount,
    Puzzle? puzzle,
    bool? solved,
    int? moves,
    GameStatus? status,
  }) {
    return GameState(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      puzzle: puzzle ?? this.puzzle,
      solved: solved ?? this.solved,
      moves: moves ?? this.moves,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        crossAxisCount,
        puzzle,
        solved,
        moves,
        status,
      ];
}
