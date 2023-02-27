import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/src/utils/color_brightness.dart';

import '../../themes/app_theme.dart';

class HomeScreenMedium extends StatelessWidget {
  const HomeScreenMedium({super.key});

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
        return AppTheme.primary.darken(0.05);
      }
      return AppTheme.primary; // default color
    }
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              child: const Text('home screen medium'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () => context.go('/game'),
              icon: const Icon(Icons.discord),
              label: const Text('Go Game'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(getColor)),
            ),
          ],
        ),
      ),
    );
  }
}
