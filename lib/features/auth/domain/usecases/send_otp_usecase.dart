import '../respositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<void> call(String countryCode, String phone) async {
    await repository.sendOtp(countryCode, phone);
  }
}