import '../respositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<Map<String, dynamic>> call(String countryCode, String phone) async {
    return await repository.sendOtp(countryCode, phone);
  }
}