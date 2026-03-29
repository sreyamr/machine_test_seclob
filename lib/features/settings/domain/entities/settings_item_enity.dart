class SettingsItemEntity {
  final String title;
  final String icon;
  final bool isDanger;

  SettingsItemEntity({
    required this.title,
    required this.icon,
    this.isDanger = false,
  });
}