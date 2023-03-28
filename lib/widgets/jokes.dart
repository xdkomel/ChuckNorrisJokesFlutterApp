import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_controllers/jokes_view_controller.dart';
import 'package:flutter_application_1/widgets/error_happened.dart';
import 'package:flutter_application_1/widgets/swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<StatefulWidget> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  final controller = JokesViewController();

  @override
  initState() {
    super.initState();
    controller.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ErrorHappened(
            errorText: "check-internet-connection".i18n(),
            updateFun: controller.updateCards),
        ProviderScope(child: Swiper(con: controller))
      ],
    );
  }
}
