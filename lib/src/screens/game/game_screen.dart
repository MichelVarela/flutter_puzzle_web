import 'package:flutter/material.dart';

import 'package:my_app/src/utils/responsive_layout.dart';
import 'package:my_app/src/screens/game/game_screen_small.dart';
import 'package:my_app/src/screens/game/game_screen_medium.dart';
import 'package:my_app/src/screens/game/game_screen_large.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      smallChild: GameScreenSmall(),
      mediumChild: GameScreenMedium(),
      largeChild: GameScreenLarge(),
    );
  }
}
