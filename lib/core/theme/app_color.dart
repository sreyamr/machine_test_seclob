import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFA759FF);
  static const Color secondary = Color(0xFF3132D1);
  static const Color grey900 = Color(0xFF212121);
  static const background = Color(0xFF000000);
  static const white = Colors.white;
  static const greyText = Color(0xFFB0B0B0);
  static const red = Colors.red;
  static const gradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}