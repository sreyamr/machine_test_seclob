import 'package:flutter/material.dart';

import '../../data/datasources/settings_locall_data_source.dart';
import '../../domain/entities/settings_item_enity.dart';

class SettingsProvider extends ChangeNotifier {
  final SettingsLocalDataSource dataSource;

  SettingsProvider(this.dataSource);

  List<SettingsItemEntity> items = [];

  void loadSettings() {
    items = dataSource.getSettings();
    notifyListeners();
  }
}