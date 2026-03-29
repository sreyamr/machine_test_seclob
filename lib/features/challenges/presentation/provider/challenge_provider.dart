import 'package:flutter/material.dart';

import '../../data/data_sources/challenge_local_data_source.dart';
import '../../domain/entities/challenge_entity.dart';
import '../pages/challenge_screen.dart';

class ChallengeProvider extends ChangeNotifier {
  final ChallengeLocalDataSource dataSource;

  ChallengeProvider(this.dataSource);

  List<ChallengeEntity> challenges = [];

  void loadChallenges() {
    challenges = dataSource.getChallenges();
    notifyListeners();
  }
}