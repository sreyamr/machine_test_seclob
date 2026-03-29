import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../constants/app_image.dart';

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
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: showBack
          ? GestureDetector(
        onTap: onBack ?? () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            height: 60,
            AppImage.back,
            //fit: BoxFit.contain,
          ),
        ),
      )
          : null,


      title: title != null
          ? Text(
        title!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      )
          : null,


      actions: action != null ? [action!] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}