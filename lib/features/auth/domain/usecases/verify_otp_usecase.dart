import '../respositories/auth_repository.dart';
class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Map<String, dynamic>> call(String countryCode, String phone, String otp) async {
    return await repository.verifyOtp(countryCode, phone, otp);
  }
}