import '../../domain/entities/challenge_entity.dart';

class ChallengeModel extends ChallengeEntity {
  ChallengeModel({
    required super.title,
    required super.brand,
    required super.image,
    required super.stepGoal,
    required super.discount,
    required super.days,
  });
}