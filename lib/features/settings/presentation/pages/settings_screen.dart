import 'package:flutter/material.dart';
import 'package:machine_test/core/widgets/custom_app_bar.dart';
import 'package:machine_test/features/settings/presentation/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsProvider>().loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
appBar: const CustomAppBar(title: "Settings",),
      body: ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];

          return SettingsTile(
            title: item.title,
            isDanger: item.isDanger,
            onTap: () {
            }, icon: item.icon
          );
        },
      ),
    );
  }
}