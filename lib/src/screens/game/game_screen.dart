import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_app/src/utils/responsive_layout.dart';
import 'package:my_app/src/screens/game/game_screen_small.dart';
import 'package:my_app/src/screens/game/game_screen_medium.dart';
import 'package:my_app/src/screens/game/game_screen_large.dart';
import 'package:provider/provider.dart';

import '../../controllers/game_controller.dart';
import '../../widgets/show_winner_dialog.dart';

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
              const Duration(milliseconds: 200),
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
}
