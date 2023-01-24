import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/my_app.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    const ProviderScope( // Permite que los widgets puedan acceder al state de los providers
      child: MyApp(),
    ),
  );
}
