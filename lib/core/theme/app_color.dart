import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFA759FF);
  static const Color secondary = Color(0xFF3132D1);

  static const background = Color(0xFF0D0D0D);
  static const white = Colors.white;
  static const greyText = Color(0xFFB0B0B0);

  static const gradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}