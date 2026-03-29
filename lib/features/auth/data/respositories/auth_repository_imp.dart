

import '../../domain/respositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> sendOtp(String countryCode, String phone) async {
    return await remoteDataSource.sendOtp(countryCode, phone);
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(
      String countryCode, String phone, String otp) async {
    return await remoteDataSource.verifyOtp(countryCode, phone, otp);
  }
}