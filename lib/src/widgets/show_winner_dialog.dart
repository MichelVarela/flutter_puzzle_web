import 'package:flutter/material.dart';

import '../controllers/game_controller.dart';
import '../utils/time_parser.dart';

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
