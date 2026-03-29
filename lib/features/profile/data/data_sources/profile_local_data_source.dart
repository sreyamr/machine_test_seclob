import 'package:machine_test/core/constants/app_image.dart';

import '../models/profile_model.dart';

class ProfileLocalDataSource {
  ProfileModel getProfile() {
    return ProfileModel(
      name: "David John",
      email: "davidjohn@gmail.com",
      phone: "+91 1234567890",
      todaySteps: 2500,
      totalSteps: 100000,
      image: AppImage.img
    );
  }
}