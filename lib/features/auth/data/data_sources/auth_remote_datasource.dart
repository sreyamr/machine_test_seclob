import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<void> sendOtp(String countryCode, String phone) async {
    await apiClient.post(
      ApiEndpoints.sendOtp,
      data: {
        "countryCode": countryCode.toString(),
        "whatsappNumber": phone.toString(),
      },
    );
  }

  Future<void> verifyOtp(
      String countryCode, String phone, String otp) async {
    await apiClient.post(
      ApiEndpoints.verifyOtp,
      data: {
        "whatsappNumber": "$countryCode$phone",
        "otp": otp,
      },
    );
  }
}