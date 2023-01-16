import 'package:flutter/material.dart';
import 'launch_screen.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void start() async {
    navigatorKey = GlobalKey<NavigatorState>();
    runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(),
          home: const LaunchScreen()),
    );
  }
}
