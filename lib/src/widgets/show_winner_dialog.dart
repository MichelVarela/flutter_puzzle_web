import 'package:flutter/material.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:my_app/src/utils/color_brightness.dart';

import '../controllers/game_controller.dart';
import '../utils/time_parser.dart';

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed, // Any states you want to affect here
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    // if any of the input states are found in our list
    return AppTheme.primary.darken(0.2);
  }
  return AppTheme.primary; // default color
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
          const Text(
            "GREAT JOB!",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "moves: ${controller.state.moves}",
            style: const TextStyle(fontSize: 12.0),
          ),
          Text("time: ${parseTime(controller.time.value)}",
              style: const TextStyle(fontSize: 12.0)),
          const SizedBox(height: 20.0),
          TextButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppTheme.white),
              ))
        ],
      ),
    ),
  );
}
