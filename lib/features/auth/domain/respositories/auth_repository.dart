abstract class AuthRepository {
  Future<void> sendOtp(String countryCode, String phone);
  Future<void> verifyOtp(String countryCode, String phone, String otp);
}