import 'package:flutter/material.dart';
import 'package:machine_test/core/theme/app_color.dart';
import 'package:machine_test/core/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../provider/auth_provider.dart';

class OtpScreen extends StatelessWidget {
  final String phone;

  OtpScreen({super.key, required this.phone});

  final List<TextEditingController> controllers =
  List.generate(5, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
  List.generate(5, (_) => FocusNode());

  String _getOtp() {
    return controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


             Text(
              "Enter verification code",
              style: AppTextStyles.medium
            ),


            Text(
              "Sent to +91 $phone",
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return _buildOtpBox(index);
              }),
            ),

            const Spacer(),

            // GestureDetector(
            //   onTap: provider.isLoading
            //       ? null
            //       : () async {
            //     final otp = _getOtp();
            //
            //     if (otp.length < 5) {
            //       AppSnackbar.show(
            //         context: context,
            //         message: "Enter complete OTP",
            //       );
            //
            //       return;
            //     }
            //
            //     bool success = await context
            //         .read<AuthProvider>()
            //         .verifyOtp(otp);
            //
            //     // if (success) {
            //     //   Navigator.pushNamedAndRemoveUntil(
            //     //     context,
            //     //     AppRoutes.home,
            //     //         (route) => false,
            //     //   );
            //     // }
            //       Navigator.pushNamedAndRemoveUntil(
            //         context,
            //         AppRoutes.home,
            //             (route) => false,
            //       );
            //   },
            //   child: Container(
            //     height: 50,
            //     decoration: BoxDecoration(
            //       gradient: const LinearGradient(
            //         colors: [Colors.purple, Colors.blue],
            //       ),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Center(
            //       child: provider.isLoading
            //           ? const SizedBox(
            //         height: 20,
            //         width: 20,
            //         child: AppLoader()
            //       )
            //           : const Text(
            //         "Verify",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            AppButton(
              text: "Verify",
              isLoading: provider.isLoading,
              onTap: () async {
                final otp = _getOtp();

                if (otp.length < 5) {
                  AppSnackbar.show(
                    context: context,
                    message: "Enter complete OTP",
                  );
                  return;
                }
                bool success =
                await context.read<AuthProvider>().verifyOtp(otp);

                // if (success) {
                //   Navigator.pushNamedAndRemoveUntil(
                //     context,
                //     AppRoutes.home,
                //         (route) => false,
                //   );
                // }
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                        (route) => false,
                  );
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 45,
      height: 55,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),


        onChanged: (value) {
          if (value.isNotEmpty && index < 4) {
            focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }


}