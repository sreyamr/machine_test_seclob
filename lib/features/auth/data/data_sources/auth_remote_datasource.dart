import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<Map<String, dynamic>> sendOtp(String countryCode, String phone) async {
    final response = await apiClient.post(
      ApiEndpoints.sendOtp,
      data: {
        "whatsappNumber": phone,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> verifyOtp(
      String countryCode, String phone, String otp) async {
    final response = await apiClient.post(
      ApiEndpoints.verifyOtp,
      data: {
        "whatsappNumber": phone,
        "otp": otp,
      },
    );
    return response.data;
  }
}