import 'package:flutter/material.dart';
import 'package:my_app/src/controllers/game_state.dart';
import 'package:my_app/src/widgets/button_outlined.dart';
import 'package:provider/provider.dart';
import '../../controllers/game_controller.dart';
import '../../widgets/game_buttons.dart';
import '../../widgets/puzzle_interactor.dart';
import '../../widgets/time_and_moves.dart';

class GameScreenSmall extends StatelessWidget {
  const GameScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimeAndMoves(),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PuzzleInteractor(),
                ),
              ),
              const GameButtons(),
              ButtonOutlined(
                  name: 'Type-picture',
                  onTap: () => controller.changeType(GameType.picture)),
              ButtonOutlined(
                  name: 'Type-clasic',
                  onTap: () => controller.changeType(GameType.clasic))
            ],
          ),
        ),
      ),
    );
  }
}
