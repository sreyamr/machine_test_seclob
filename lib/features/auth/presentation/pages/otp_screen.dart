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
import 'dart:async';


class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> controllers =
  List.generate(5, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
  List.generate(5, (_) => FocusNode());

  int _secondsRemaining = 30;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 30;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  String _getOtp() {
    return controllers.map((e) => e.text).join();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter verification code", style: AppTextStyles.medium),
            Text("Sent to +91 ${widget.phone}", style: AppTextStyles.subtitle),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) => _buildOtpBox(index)),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Center(
              child: _canResend
                  ? GestureDetector(
                onTap: () {

                  context.read<AuthProvider>().sendOtp(widget.phone);
                  _startTimer();
                },
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : Text(
                "Get verification code again in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20,),
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
//                 //   Navigator.pushNamedAndRemoveUntil(
//                 //     context,
//                 //     AppRoutes.home,
//                 //         (route) => false,
//                 //   );
//                 // }
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                      (route) => false,
                );
              },
            ),
            const SizedBox(height: 20,),
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