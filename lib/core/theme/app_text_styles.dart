import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTextStyles {
  static TextStyle title = GoogleFonts.workSans(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle medium = GoogleFonts.workSans(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );
  static TextStyle subtitle = GoogleFonts.workSans(
    fontSize: 13,
    color: AppColors.greyText,
  );

  static TextStyle button = GoogleFonts.workSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle smallGrey = TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );

  static const TextStyle link = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}