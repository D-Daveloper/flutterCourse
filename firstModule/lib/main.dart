import 'package:flutter/material.dart';
import 'package:basics_first_app/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
            Color.fromARGB(211, 85, 111, 198), Color.fromARGB(255, 255, 82, 2)),
      ),
    );
  }
}
