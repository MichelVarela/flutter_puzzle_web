import 'package:flutter/material.dart';
import '../../widgets/game_buttons.dart';
import '../../widgets/puzzle_interactor.dart';
import '../../widgets/time_and_moves.dart';

class GameScreenSmall extends StatelessWidget {
  const GameScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TimeAndMoves(),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PuzzleInteractor(),
                ),
              ),
              GameButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
