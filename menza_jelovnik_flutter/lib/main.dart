import 'package:flutter/material.dart';
import 'package:menza_jelovnik/screens/loadingScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
