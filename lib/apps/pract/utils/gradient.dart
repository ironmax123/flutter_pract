import 'package:flutter/material.dart';

class GradientStyle {
  static const purpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFC75ECD),
      Color(0xFF12BB6C),
    ],
  );
}

const double kDefaultPadding = 16;
