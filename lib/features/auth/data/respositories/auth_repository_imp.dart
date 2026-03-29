

import '../../domain/respositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> sendOtp(String countryCode, String phone) async {
    await remoteDataSource.sendOtp(countryCode, phone);
  }

  @override
  Future<void> verifyOtp(
      String countryCode, String phone, String otp) async {
    await remoteDataSource.verifyOtp(countryCode, phone, otp);
  }
}