class ProfileEntity {
  final String name;
  final String email;
  final String phone;
  final int todaySteps;
  final int totalSteps;
  final String image;

  ProfileEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.todaySteps,
    required this.totalSteps,
    required this.image,
  });
}