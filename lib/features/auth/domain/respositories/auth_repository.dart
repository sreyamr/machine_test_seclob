abstract class AuthRepository {
  Future<Map<String, dynamic>> sendOtp(String countryCode, String phone);
  Future<Map<String, dynamic>> verifyOtp(String countryCode, String phone, String otp);
}