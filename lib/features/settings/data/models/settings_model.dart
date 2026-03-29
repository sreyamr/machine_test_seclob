
import '../../domain/entities/settings_item_enity.dart';

class SettingsItemModel extends SettingsItemEntity {
  SettingsItemModel({
    required super.title,
    required super.icon,
    super.isDanger,
  });
}