import 'package:equatable/equatable.dart';

import 'position.dart';

class Tile extends Equatable {
  const Tile({
    required this.value,
    required this.position,
    required this.correctPosition,
  });

  final int value;
  final Position position;
  final Position correctPosition;

  Tile move(Position newPosition) {
    return Tile(
        value: value, correctPosition: correctPosition, position: newPosition);
  }

  @override
  List<Object?> get props => [
        value,
        position,
        correctPosition,
      ];
}
