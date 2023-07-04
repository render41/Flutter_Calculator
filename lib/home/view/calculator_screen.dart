import 'package:calculator/home/model/data/calculator_data.dart';
import 'package:calculator/res/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Total Buttons: ${buttonList.length}');

    return Scaffold(
      backgroundColor: const Color(0xFF1D2630),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [inputText, resultText],
            ),
          ),
          const Divider(thickness: 0.1, color: Colors.white),
          keyCalculator,
        ],
      ),
    );
  }

  Widget get inputText {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.centerRight,
      child: Text(
        userInput,
        style: const TextStyle(
          fontSize: 32,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget get resultText {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.centerRight,
      child: Text(
        result,
        style: const TextStyle(
          fontSize: 48,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget get keyCalculator {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: buttonList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (BuildContext context, int index) {
            return customButton(buttonList[index]);
          },
        ),
      ),
    );
  }

  Widget customButton(String text) {
    return InkWell(
      splashColor: const Color(0xFF1D2639),
      onTap: () => setState(() => handleButtons(text)),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColor().getBackgroundColor(text),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.15),
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: const Offset(-3, -3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: AppColor().getColor(text),
                fontSize: 32,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }

  handleButtons(String text) {
    if (text == 'AC') {
      userInput = '';
      result = '0';
      return;
    }

    if (text == 'C') {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    }

    if (text == '=') {
      result = calculate();
      userInput = result;
      if (userInput.endsWith('.0')) {
        userInput = userInput.replaceAll('.0', '');
      }
      if (result.endsWith('.0')) {
        result = result.replaceAll('.0', '');
        return;
      }
    }

    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
