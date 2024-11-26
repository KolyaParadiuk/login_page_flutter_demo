import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle title28bold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle body16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body13Regular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}

extension TextStyleX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}
