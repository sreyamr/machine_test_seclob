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


  Future<Map<String, dynamic>?> sendOtp(String phoneNumber) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      phone = phoneNumber;

      final response = await sendOtpUseCase(countryCode, phoneNumber);
      return response;
    } catch (e) {
      if (e is DioException) {
        errorMessage = e.response?.data["error"] ?? "Something went wrong";
      } else {
        errorMessage = "Unexpected error";
      }
      return {"success": false, "error": errorMessage};
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> verifyOtp(String otp) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await verifyOtpUseCase(countryCode, phone, otp);
      return response;
    } catch (e) {
      if (e is DioException) {
        errorMessage = e.response?.data["error"] ?? "Invalid OTP";
        return {"success": false, "error": errorMessage};
      } else {
        errorMessage = "Unexpected error";
        return {"success": false, "error": errorMessage};
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}