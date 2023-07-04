import 'package:flutter/material.dart';

class AppColor {
  getColor(String text) {
    if (text == '/' ||
        text == '*' ||
        text == '+' ||
        text == '-' ||
        text == 'C' ||
        text == '(' ||
        text == ')') {
      return const Color.fromARGB(255, 252, 100, 100);
    }

    if (text == '=') {
      return const Color.fromARGB(255, 255, 255, 255);
    }

    return Colors.white;
  }

  getBackgroundColor(String text) {
    if (text == 'AC') {
      return const Color.fromARGB(255, 252, 100, 100);
    }

    if (text == '=') {
      return const Color.fromARGB(255, 17, 129, 7);
    }

    return const Color(0xFF1D2630);
  }
}
