import 'package:flutter/material.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:my_app/src/utils/color_brightness.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300.0),
                    child: const GameButtons()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
