
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';

import 'features/api screen/view/api_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: const ApiScreen(),
    );
  }
}
