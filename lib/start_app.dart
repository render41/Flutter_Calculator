import 'package:calculator/home/view/calculator_screen.dart';
import 'package:flutter/material.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CalculatorScreen());
  }
}
