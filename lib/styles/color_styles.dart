import 'dart:ui';

enum LocalColorStyles {
  red(Color(0xFFFF3b30)),
  accent(Color(0xFF3377FF)),
  darkGray(Color(0xFF222222)),
  background(Color(0xFFFAFAFA)),
  lightGray(Color(0xFFEEEEEE));

  const LocalColorStyles(this.value);
  final Color value;
}
