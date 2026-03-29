
import '../../../../core/constants/app_image.dart';
import '../models/settings_model.dart';

class SettingsLocalDataSource {
  List<SettingsItemModel> getSettings() {
    return [
      SettingsItemModel(title: "Profile", icon: AppImage.profile),
      SettingsItemModel(title: "Wallet & Reward’s", icon: AppImage.wallet),
      SettingsItemModel(title: "Notification", icon: AppImage.notification),
      SettingsItemModel(title: "Bank Account", icon: AppImage.bank),
      SettingsItemModel(title: "Subscription", icon: AppImage.subscription),
      SettingsItemModel(title: "Privacy Policy", icon: AppImage.privacy),
      SettingsItemModel(title: "Terms & Conditions", icon: AppImage.terms),
      SettingsItemModel(title: "FAQs", icon: AppImage.faq),
      SettingsItemModel(title: "Logout", icon: AppImage.terms),
      SettingsItemModel(
        title: "Delete Account",
        icon:  AppImage.delete,
        isDanger: true,
      ),
    ];
  }
}