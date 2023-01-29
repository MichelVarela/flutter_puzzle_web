import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenSmall extends StatelessWidget {
  const HomeScreenSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.indigo,
              child: const Text('home screen small'),
            ),
            IconButton(onPressed: () => context.go('/game'), icon: const Icon(Icons.discord)),
          ],
        ),
      ),
    );
  }
}
