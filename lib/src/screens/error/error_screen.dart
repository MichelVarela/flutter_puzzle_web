import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:my_app/src/utils/color_brightness.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'error: $error',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            TextButton(
                onPressed: () => context.go('/'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                  backgroundColor: MaterialStateProperty.resolveWith(getColor),
                ),
                child: const Text(
                  'Go home',
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.white),
                ))
          ],
        ),
      ),
    );
  }
}
