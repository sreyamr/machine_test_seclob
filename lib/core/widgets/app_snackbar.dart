import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class AppSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,

        content: Text(
          message,
          style: AppTextStyles.button.copyWith(
            color: textColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}