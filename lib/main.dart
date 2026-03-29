import 'package:flutter/material.dart';
import 'package:machine_test/features/settings/presentation/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'core/network/api_client.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'features/auth/data/data_sources/auth_remote_datasource.dart';
import 'features/auth/data/respositories/auth_repository_imp.dart';
import 'features/auth/domain/usecases/send_otp_usecase.dart';
import 'features/auth/domain/usecases/verify_otp_usecase.dart';
import 'features/auth/presentation/provider/auth_provider.dart';
import 'features/challenges/data/data_sources/challenge_local_data_source.dart';
import 'features/challenges/presentation/provider/challenge_provider.dart';
import 'features/home/presentation/provider/naviagtion_provider.dart';
import 'features/profile/data/data_sources/profile_local_data_source.dart';
import 'features/profile/presentation/provider/profile_provider.dart';
import 'features/settings/data/datasources/settings_locall_data_source.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final remoteDataSource = AuthRemoteDataSource(apiClient);
    final repository = AuthRepositoryImpl(remoteDataSource);
    final settingsDataSource = SettingsLocalDataSource();
    final sendOtpUseCase = SendOtpUseCase(repository);
    final verifyOtpUseCase = VerifyOtpUseCase(repository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            sendOtpUseCase,
            verifyOtpUseCase,
          ),
        ),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(settingsDataSource),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(ProfileLocalDataSource()),
        ),
        ChangeNotifierProvider(
          create: (_) => ChallengeProvider(ChallengeLocalDataSource()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
