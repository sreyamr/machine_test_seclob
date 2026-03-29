import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_color.dart';
import 'loading_widget.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
            AppColors.primary,
              AppColors.secondary
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
            height: 20,
            width: 20,
            child: AppLoader(),
          )
              : Text(
            text,
            style: AppTextStyles.button,
          ),
        ),
      ),
    );
  }
}