import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/joke_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'card_contents.dart';
import 'card_overlay.dart';

class JokeCard extends StatefulWidget {
  const JokeCard({super.key, required this.model});

  final JokeModel model;

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool _isOverlayShown = false;

  void toggleOverlay() {
    setState(() {
      if (_isOverlayShown) {
        _isOverlayShown = false;
      } else {
        _isOverlayShown = true;
      }
    });
  }

  void openLink() async {
    if (await canLaunchUrl(Uri.parse(widget.model.url))) {
      await launchUrl(Uri.parse(widget.model.url));
    } else {
      developer.log("Couldn't launch the URL");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: toggleOverlay,
        onDoubleTap: openLink,
        child: Stack(
          children: [
            CardContents(jokeText: widget.model.value),
            CardOverlay(isOverlayShown: _isOverlayShown),
          ],
        ));
  }
}
