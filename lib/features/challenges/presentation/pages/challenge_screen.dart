import 'package:flutter/material.dart';
import 'package:machine_test/core/constants/app_image.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../provider/challenge_provider.dart';
import '../widgets/active_challenge_card.dart';
import '../widgets/challenge_card.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ChallengeProvider>().loadChallenges();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChallengeProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: ""),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Text(
            "Active Challenge",
            style: AppTextStyles.semiBold,
          ),

          const SizedBox(height: 10),

           const ActiveChallengeCard(
            image: AppImage.img1,
            brand: "Nikshan Electronics",
            days: 5,
            stepGoal: 5000,
            completedSteps: 2000,
          ),

          Text(
            "Available",
            style: AppTextStyles.semiBold,
          ),

          const SizedBox(height: 10),
          ...provider.challenges.map((e) {
            return ChallengeCard(
              title: e.title,
              brand: e.brand,
              image: e.image,
              stepGoal: e.stepGoal,
              discount: e.discount,
              days: e.days,
            );
          }).toList(),
        ],
      ),
    );
  }
}