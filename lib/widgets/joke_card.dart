import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'card_contents.dart';
import 'card_overlay.dart';

class JokeCard extends StatefulWidget {
  const JokeCard({super.key, required this.jokeText, required this.url});

  final String jokeText;
  final Uri url;

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
    if (await canLaunchUrl(widget.url)) {
      await launchUrl(widget.url);
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
            CardContents(jokeText: widget.jokeText),
            CardOverlay(isOverlayShown: _isOverlayShown),
          ],
        ));
  }
}
