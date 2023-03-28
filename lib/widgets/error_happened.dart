import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_styles.dart';
import 'package:flutter_application_1/styles/text_styles.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ErrorHappened extends StatelessWidget {
  const ErrorHappened(
      {required this.errorText, required this.updateFun, super.key});

  final VoidCallback? updateFun;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FeatherIcons.frown,
              size: 64.0,
              color: LocalColorStyles.darkGray.value,
            ),
            const SizedBox(
              height: 8,
            ),
            errorText == null
                ? const SizedBox.shrink()
                : Text(
                    errorText!,
                    textAlign: TextAlign.center,
                    style: LocalTextStyles.boldHeading
                        .stylize(LocalColorStyles.darkGray.value),
                  ),
            const SizedBox(
              height: 8,
            ),
            updateFun == null
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: updateFun,
                    icon: Icon(
                      Icons.update_rounded,
                      size: 40.0,
                      color: LocalColorStyles.accent.value,
                    ))
          ],
        ),
      ),
    );
  }
}
