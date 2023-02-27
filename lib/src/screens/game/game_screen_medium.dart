import 'package:flutter/material.dart';
import 'package:my_app/src/utils/color_brightness.dart';
import 'package:provider/provider.dart';

import '../../controllers/game_controller.dart';
import '../../themes/app_theme.dart';
import '../../widgets/game_buttons.dart';
import '../../widgets/puzzle_interactor.dart';
import '../../widgets/time_and_moves.dart';

class GameScreenMedium extends StatelessWidget {
  const GameScreenMedium({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final palette = Provider.of<GameController>(context, listen: false).palette;
    Color bg() {
      if (palette != null) {
        if (palette.darkMutedColor?.color != null) {
          return palette.darkMutedColor!.color;
        }
      }
      return AppTheme.primary.darken(0.2);
    }

    return Scaffold(
      backgroundColor: bg(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 992.0),
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PuzzleInteractor(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const TimeAndMoves(),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        child: const GameButtons(),
                      ),
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
