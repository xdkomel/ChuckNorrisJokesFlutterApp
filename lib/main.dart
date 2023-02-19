import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/jokes.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Jokes(),
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
      );
}
