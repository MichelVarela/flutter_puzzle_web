import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenMedium extends StatelessWidget {
  const HomeScreenMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              child: const Text('home screen medium'),
            ),
            IconButton(onPressed: () => context.go('/game'), icon: const Icon(Icons.discord)),
          ],
        ),
      ),
    );
  }
}
