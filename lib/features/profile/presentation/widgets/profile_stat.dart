import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_color.dart';

class ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  const ProfileStat({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.subtitle),
        const SizedBox(height: 5),
        Text(
          value,
          style: AppTextStyles.title.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}