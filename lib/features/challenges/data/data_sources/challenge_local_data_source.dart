import 'package:machine_test/core/constants/app_image.dart';

import '../models/challenge_model.dart';

class ChallengeLocalDataSource {
  List<ChallengeModel> getChallenges() {
    return [
      ChallengeModel(
        title: "Get 30% off on Samsung watch for your next 5000 Steps!",
        brand: "Nikshan Electronics",
        image: AppImage.img3,
        stepGoal: 5000,
        discount: 30,
        days: 5,

      ),
      ChallengeModel(
        title: "Get 70% off on Samsung watch for your next 5000 Steps!",
        brand: "ABC Shoes",
        image: AppImage.img2,
        stepGoal: 5000,
        discount: 70,
        days: 10,
      ),
      ChallengeModel(
        title: "Get 70% off on Samsung watch for your next 5000 Steps!",
        brand: "ABC Shoes",
        image: AppImage.img1,
        stepGoal: 5000,
        discount: 70,
        days: 10,
      ),
    ];
  }
}