import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_color.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.subtitle),
        const SizedBox(height: 6),
        Text(
          value,
          style: AppTextStyles.title.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Divider(color: AppColors.greyText.withOpacity(0.2)),
      ],
    );
  }
}