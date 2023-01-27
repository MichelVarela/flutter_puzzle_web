/* import 'package:flutter/material.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(icon: const Icon(Icons.menu_open_rounded), onPressed: () => Scaffold.of(context).openDrawer(),),
      title: Text('Appbar'),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// styles
import 'package:my_app/src/themes/app_themes.dart';

class Navbar extends HookWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    /* return AppBar(
      backgroundColor: AppThemes.primary,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: const Text('Games'),
    ); */
    return Container(
      color: AppThemes.primary,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            color: AppThemes.white,
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
      ),
    );
  }
}