import 'package:flutter/material.dart';
import 'package:machine_test/core/constants/app_image.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_color.dart';


class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.onboarding,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(

        child:Image.asset(AppImage.logo,height: 80,)
      ),
    );
  }
}