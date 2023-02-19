import 'package:flutter/material.dart';

enum LocalShadowStyles {
  card(BoxShadow(color: Color(0xFFDEDEDE), spreadRadius: 8, blurRadius: 16));

  const LocalShadowStyles(this.shadow);
  final BoxShadow shadow;
}
