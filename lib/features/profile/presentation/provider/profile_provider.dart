import 'package:flutter/material.dart';

import '../../data/data_sources/profile_local_data_source.dart';
import '../../domain/entities/profile_entity.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileLocalDataSource dataSource;

  ProfileProvider(this.dataSource);

  ProfileEntity? profile;

  void loadProfile() {
    profile = dataSource.getProfile();
    notifyListeners();
  }
}