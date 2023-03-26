import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/jokes.dart';
import 'package:flutter_application_1/styles/color_styles.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: const SafeArea(
            child: Jokes(),
          ),
          backgroundColor: LocalColorStyles.background.value,
        ),
      );
}
