import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  AuthProvider(this.sendOtpUseCase, this.verifyOtpUseCase);

  bool isLoading = false;
  String phone = "";
  String countryCode = "+91";
  String? errorMessage;


  Future<bool> sendOtp(String phoneNumber) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      phone = phoneNumber;

      await sendOtpUseCase(countryCode, phoneNumber);

      return true;
    } catch (e) {
      if (e is DioException) {

        errorMessage =
            e.response?.data["error"] ?? "Something went wrong";
      } else {
        errorMessage = "Unexpected error";
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String otp) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await verifyOtpUseCase(countryCode, phone, otp);

      return true;
    } catch (e) {
      if (e is DioException) {
        errorMessage =
            e.response?.data["error"] ?? "Invalid OTP";
      } else {
        errorMessage = "Unexpected error";
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}