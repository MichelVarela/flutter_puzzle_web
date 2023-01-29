import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenLarge extends StatelessWidget {
  const HomeScreenLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.orange,
              child: const Text('home screen large'),
            ),
            IconButton(onPressed: () => context.go('/game'), icon: const Icon(Icons.discord)),
          ],
        ),
      ),
    );
  }
}
