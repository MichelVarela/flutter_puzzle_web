import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_app/src/utils/responsive_layout.dart';
import 'package:my_app/src/screens/game/game_screen_small.dart';
import 'package:my_app/src/screens/game/game_screen_medium.dart';
import 'package:my_app/src/screens/game/game_screen_large.dart';
import 'package:provider/provider.dart';

import '../../controllers/game_controller.dart';
import '../../utils/time_parser.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = GameController();

        controller.onFinish.listen(
          (_) {
            Timer(
              const Duration(milliseconds: 300),
              () {
                showWinnerDialog(context, controller);
              },
            );
          },
        );
        return controller;
      },
      child: const ResponsiveLayout(
        smallChild: GameScreenSmall(),
        mediumChild: GameScreenMedium(),
        largeChild: GameScreenLarge(),
      ),
    );
  }

  void showWinnerDialog(
    BuildContext context,
    GameController controller,
  ) {
    showDialog(
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("GREAT JOB"),
            Text("moves: ${controller.state.moves}"),
            Text("time: ${parseTime(controller.time.value)}"),
            const SizedBox(height: 20.0),
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
