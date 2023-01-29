import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_app/src/utils/responsive_layout.dart';
import 'package:my_app/src/screens/game/game_screen_small.dart';
import 'package:my_app/src/screens/game/game_screen_medium.dart';
import 'package:my_app/src/screens/game/game_screen_large.dart';
import 'package:provider/provider.dart';

import '../../controllers/game_controller.dart';
import '../../utils/time_parser.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);

    controller.onFinish.listen(
      (_) {
        Timer(
          const Duration(milliseconds: 200),
          () {
            _showWinnerDialog(context, controller);
          },
        );
      },
    );

    return const ResponsiveLayout(
      smallChild: GameScreenSmall(),
      mediumChild: GameScreenMedium(),
      largeChild: GameScreenLarge(),
    );
  }

  void _showWinnerDialog(
    BuildContext context,
    GameController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("GREAT JOB"),
            Text("moves: ${controller.state.moves}"),
            Text("time: ${parseTime(controller.time.value)}"),
            const SizedBox(height: 20),
            TextButton(
              child: const Text("OK"),
              onPressed: () => context.go('/game'),
            ),
          ],
        ),
      ),
    );
  }
}
