import '../respositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<void> call(
      String countryCode, String phone, String otp) async {
    await repository.verifyOtp(countryCode, phone, otp);
  }
}