import 'package:flutter/material.dart';
import 'package:machine_test/core/constants/app_image.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';

class ActiveChallengeCard extends StatelessWidget {
  final String image;
  final String brand;
  final int days;
  final int stepGoal;
  final int completedSteps;

  const ActiveChallengeCard({
    super.key,
    required this.image,
    required this.brand,
    required this.days,
    required this.stepGoal,
    required this.completedSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.asset(
                  AppImage.img1,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: AppColors.darkPurple,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          brand,
                          style: AppTextStyles.subtitle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            "$days Day’s",
                            style: AppTextStyles.subtitle.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),


                Text(
                  "Get 30% off on Samsung watch for your next $stepGoal Steps!",
                  style: AppTextStyles.medium.copyWith(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 12),


                Row(
                  children: [
                    Expanded(
                        child: _infoBox("Step Goal", "$stepGoal")),
                    const SizedBox(width: 8),
                    Expanded(
                        child: _infoBox("Total Steps", "$completedSteps")),
                    const SizedBox(width: 8),
                    Expanded(child: _infoBox("Price", "30% off")),
                  ],
                ),

                const SizedBox(height: 14),

                /// BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Exit",
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Pause Challenge",
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.subtitle.copyWith(
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.button.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}