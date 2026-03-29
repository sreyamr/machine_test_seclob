import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.todaySteps,
    required super.totalSteps,
    required super.image,
  });


  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      todaySteps: json['today_steps'] ?? 0,
      totalSteps: json['total_steps'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}