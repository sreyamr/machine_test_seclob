import 'package:flutter/material.dart';
import 'package:machine_test/core/theme/app_color.dart';
import 'package:machine_test/core/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../provider/auth_provider.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    String phone = "";

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildTitle(),

            const SizedBox(height: 20),

            _buildPhoneInput(onChanged: (value) {
              phone = value;
            }),

            const Spacer(),

            _buildNextButton(
              context: context,
              provider: provider,
              onPressed: () async {
                if (!_isValidPhone(phone)) {
                  AppSnackbar.show(
                    context: context,
                    message: "Enter valid phone number",
                  );
                  return;
                }

                await context.read<AuthProvider>().sendOtp(phone);

                Navigator.pushNamed(
                  context,
                  AppRoutes.otp,
                  arguments: phone,
                );
              },
            ),

            const SizedBox(height: 12),

            _buildTermsText(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "Add your contact number",
          style: AppTextStyles.medium,
        ),
        const SizedBox(height: 6),
        Text(
          "A verification code will be sent to this number.",
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }


  Widget _buildPhoneInput({required Function(String) onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
       color: AppColors.grey900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Text("+91",
              style: TextStyle(color: Colors.white, fontSize: 16)),

          const SizedBox(width: 10),

          Container(width: 1, height: 20, color: Colors.grey),

          const SizedBox(width: 10),

          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "Enter phone number",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildNextButton({
    required BuildContext context,
    required AuthProvider provider,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: provider.isLoading ? null : onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.blue],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: provider.isLoading
              ? const SizedBox(
            height: 20,
            width: 20,
            child: AppLoader()
          )
              : const Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsText() {
    return const Text.rich(
      TextSpan(
        text: "By proceeding, you agree to our ",
        style: AppTextStyles.smallGrey,
        children: [
          TextSpan(
            text: "Terms & Conditions",
            style: AppTextStyles.link,
          ),
          TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            style: AppTextStyles.link,
          ),
          TextSpan(text: "."),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
  bool _isValidPhone(String phone) {
    return phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
  }
}