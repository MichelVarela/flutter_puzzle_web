import 'package:flutter/material.dart';

import '../../widgets/game_buttons.dart';
import '../../widgets/puzzle_interactor.dart';
import '../../widgets/time_and_moves.dart';

class GameScreenLarge extends StatelessWidget {
  const GameScreenLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024.0),
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400.0),
                      child: const AspectRatio(
                        aspectRatio: 1,
                        child: PuzzleInteractor(),
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 300.0),
                      child: Column(
                        children: const [
                          TimeAndMoves(),
                          GameButtons(),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}