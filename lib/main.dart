import 'package:flutter/material.dart';
import 'package:webtoong/screens/home_screen.dart';

void main() {
  runApp(const Webtoong());
}

class Webtoong extends StatelessWidget {
  const Webtoong({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
