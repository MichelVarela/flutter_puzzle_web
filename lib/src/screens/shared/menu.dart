import 'package:flutter/material.dart';

// styles
import 'package:my_app/src/themes/app_theme.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.grey,
      child: Column(
        children: const [Text('dropdown-menu')],
      ),
    );
  }
}
