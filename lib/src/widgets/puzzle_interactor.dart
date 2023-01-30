import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';
import '../controllers/game_state.dart';
import 'puzzle_tile.dart';

class PuzzleInteractor extends StatelessWidget {
  const PuzzleInteractor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final controller = context.watch<GameController>();
          final state = controller.state;
          final tileSize = constraints.maxWidth / state.crossAxisCount;

          return AbsorbPointer(
            absorbing: state.status != GameStatus.playing,
            child: Stack(
              children: state.puzzle.tiles
                  .map(
                    (e) => PuzzleTile(
                      tile: e,
                      size: tileSize,
                      onTap: () => controller.onTileTapped(e),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}