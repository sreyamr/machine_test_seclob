import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String icon;
  final bool isDanger;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    this.isDanger = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? AppColors.red : AppColors.white;

    return Column(
      children: [
        ListTile(
          onTap: onTap,

          leading: Image.asset(
            icon,
            height: 20,
            width: 22,
            fit: BoxFit.contain,
            color: color,
          ),

          title: Text(
            title,
            style: AppTextStyles.subtitle.copyWith(
              color: color,

            ),
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: isDanger ? AppColors.red : AppColors.greyText,
          ),
        ),

        Divider(
          color: AppColors.greyText.withOpacity(0.1),
        ),
      ],
    );
  }
}