import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// shared
import 'package:my_app/src/screens/shared/shared.dart';

// screens
import '../screens/screens.dart';

class AppRouter {
  
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            appBar: const Navbar(),
            endDrawer: const Menu(),
            body: Center(
              child: child,
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const HomeScreen(),
            routes: <RouteBase>[
              GoRoute(
                path: 'game',
                builder: (BuildContext context, GoRouterState state) {
                  return const GameScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
}
