import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShivDarshanApp());
}

class ShivDarshanApp extends StatelessWidget {
  const ShivDarshanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'शिव दर्शन',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const SplashScreen(),
    );
  }
}
