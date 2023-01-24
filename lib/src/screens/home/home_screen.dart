import 'package:flutter/material.dart';

import 'package:my_app/src/utils/responsive_layout.dart';
import 'package:my_app/src/screens/home/home_screen_small.dart';
import 'package:my_app/src/screens/home/home_screen_medium.dart';
import 'package:my_app/src/screens/home/home_screen_large.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      smallChild: HomeScreenSmall(),
      mediumChild: HomeScreenMedium(),
      largeChild: HomeScreenLarge(),
    );
  }
}
