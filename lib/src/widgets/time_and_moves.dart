import 'package:flutter/material.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';
import '../utils/time_parser.dart';

class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<GameController>(context, listen: false).time;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: time,
            builder: (_, time, icon) {
              return Row(
                children: [
                  icon!,
                  Text(
                    parseTime(time),
                    style: AppTheme.textStyle,
                  ),
                ],
              );
            },
            child: const Icon(
              Icons.timer_outlined,
              size: 20.0,
              color: AppTheme.white,
            ),
          ),
          Selector<GameController, int>(
            builder: (_, moves, __) {
              return Text("Moves: $moves", style: AppTheme.textStyle);
            },
            selector: (_, controller) => controller.state.moves,
          ),
        ],
      ),
    );
  }
}
