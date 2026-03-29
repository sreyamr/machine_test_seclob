import 'package:flutter/material.dart';
import 'package:machine_test/core/theme/app_color.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../challenges/presentation/pages/challenge_screen.dart';
import '../../../settings/presentation/pages/settings_screen.dart';
import '../provider/naviagtion_provider.dart';
import '../widgets/custom_bottom_nav.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime? lastPressed;

  Future<bool> _onWillPop() async {
    final provider = context.read<NavigationProvider>();

    if (provider.currentIndex != 0) {
      provider.changeIndex(0);
      return false;
    }

    final now = DateTime.now();

    if (lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 2)) {

      lastPressed = now;
      AppSnackbar.show(
        backgroundColor: AppColors.white,
        textColor: AppColors.background,
        context: context,
        message: "Press back again to exit",
      );

      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();

    final pages = [
      const Center(child: Text("Home", style: TextStyle(color: Colors.white))),
      const ChallengeScreen(),
      const Center(child: Text("Rewards", style: TextStyle(color: Colors.white))),
      const SettingsScreen(),
    ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: pages[provider.currentIndex],
        bottomNavigationBar: const CustomBottomNav(),
      ),
    );
  }
}