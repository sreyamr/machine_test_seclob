import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';
import '../provider/naviagtion_provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(context, Icons.home, "Home", 0),
          _navItem(context, Icons.emoji_events, "Challenges", 1),
          _navItem(context, Icons.card_giftcard, "Rewards", 2),
          _navItem(context, Icons.settings, "Settings", 3),
        ],
      ),
    );
  }

  Widget _navItem(
      BuildContext context, IconData icon, String label, int index) {
    final provider = context.read<NavigationProvider>();
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => provider.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}