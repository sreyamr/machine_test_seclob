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
  static const int _otpLength = 5;
  static const int _timerDuration = 30;

  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  int _secondsRemaining = _timerDuration;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (_) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = _timerDuration;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        setState(() => _canResend = true);
        _timer?.cancel();
      }
    });
  }

  String _getOtp() => _controllers.map((c) => c.text).join();

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter verification code", style: AppTextStyles.medium),
            Text("Sent to +91 ${widget.phone}", style: AppTextStyles.subtitle),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_otpLength, _buildOtpBox),
            ),
            const Spacer(),
            Center(child: _buildResendSection(context, provider)),
            const SizedBox(height: 20),
            AppButton(
              text: "Verify",
              isLoading: provider.isLoading,
              onTap: () => _verifyOtp(context, provider),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 50,
      height: 55,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
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
          if (value.isNotEmpty && index < _otpLength - 1) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  Widget _buildResendSection(BuildContext context, AuthProvider provider) {
    if (_canResend) {
      return GestureDetector(
        onTap: () {
         // provider.sendOtp(widget.phone);
          _startTimer();
        },
        child: const Text(
          "Resend OTP",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Text(
        "Get verification code again in 00:${_secondsRemaining.toString().padLeft(2, '0')}",
        style: const TextStyle(color: Colors.grey),
      );
    }
  }

  Future<void> _verifyOtp(BuildContext context, AuthProvider provider) async {
    final otp = _getOtp();
    if (otp.length < _otpLength) {
      AppSnackbar.show(context: context, message: "Enter complete OTP");
      return;
    }

    final response = await provider.verifyOtp(otp);

    if (response != null) {
      if (response["success"] == true) {
        AppSnackbar.show(
          context: context,
          backgroundColor: AppColors.success,
          message: response["message"] ?? "OTP verified successfully",
        );
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
      } else {
        AppSnackbar.show(context: context, message: response["error"] ?? "Invalid OTP");
      }
    } else {
      AppSnackbar.show(context: context, message: provider.errorMessage ?? "Something went wrong");
    }
  }
}