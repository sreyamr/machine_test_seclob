import 'package:flutter/material.dart';
import 'package:machine_test/core/theme/app_text_styles.dart';
import 'package:machine_test/core/theme/app_color.dart';

import '../../../../core/constants/app_image.dart';
import '../../../../core/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
        child: Column(
          children: [
            const SizedBox(height: 80),


            const Text(
              "Welcome Back!",
              style: AppTextStyles.smallGrey,
            ),

            const SizedBox(height: 10),


             Column(
              children: [
                Image.asset(AppImage.logo,height: 80,)
              ],
            ),

            const SizedBox(height: 40),


            Text(
              "Make the\nFirst Move",
              textAlign: TextAlign.center,
              style: AppTextStyles.title.copyWith(
                fontSize: 36,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 20),


            Text(
              "Select your method of Log in!",
              style: AppTextStyles.subtitle,
            ),

            const SizedBox(height: 30),

            _buildLoginButton(context),

            const Spacer(),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: AppTextStyles.smallGrey,
                ),
                Text(
                  "Sign up",
                  style: AppTextStyles.link.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }


  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.phoneNumber);
      },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey900,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              "Use mobile number",
              style: AppTextStyles.button,
            ),
          ],
        ),
      ),
    );
  }
}