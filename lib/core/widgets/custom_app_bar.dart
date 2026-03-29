import 'package:flutter/material.dart';
import 'package:machine_test/core/theme/app_text_styles.dart';
import '../theme/app_color.dart';
import '../constants/app_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBack;
  final VoidCallback? onBack;
  final Widget? action;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBack = true,
    this.onBack,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: showBack
            ? GestureDetector(
          onTap: onBack ?? () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              AppImage.back,
              height: 20,
            ),
          ),
        )
            : null,
      
        title: title != null
            ? Text(
          title!,
          style: AppTextStyles.medium
        )
            : null,
      
        actions: action != null ? [action!] : [],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}