import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/jokes.dart';
import 'package:flutter_application_1/styles/color_styles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [Locale("ru", "RU"), Locale("en", "US")],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale?.languageCode == "ru") {
          return const Locale('ru', 'RU');
        }
        return const Locale('en', 'US');
      },
      home: Scaffold(
        body: const SafeArea(
          child: Jokes(),
        ),
        backgroundColor: LocalColorStyles.background.value,
      ),
    );
  }
}
