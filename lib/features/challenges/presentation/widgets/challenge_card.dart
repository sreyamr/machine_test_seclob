import 'package:flutter/material.dart';
import 'package:machine_test/core/widgets/custom_button.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';

class ChallengeCard extends StatelessWidget {
  final String title;
  final String brand;
  final String image;
  final int stepGoal;
  final int discount;
  final int days;

  const ChallengeCard({
    super.key,
    required this.title,
    required this.brand,
    required this.image,
    required this.stepGoal,
    required this.discount,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(image,
                height: 140, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      brand,
                      style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.background.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.background.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: AppColors.background,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$days Day's",
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.background,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: AppTextStyles.medium
                      .copyWith(color: AppColors.background),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _infoBox("Step Goal", Formatters.number(stepGoal)),
                    _infoBox("Price", "$discount% off"),
                  ],
                ),
                const SizedBox(height: 12),
                AppButton(
                  text: "Accept the Challenge",
                  onTap: () {},
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
      width: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title,
              style:
                  AppTextStyles.subtitle.copyWith(color: AppColors.background)),
          Text(value,
              style: AppTextStyles.semiBold.copyWith(
                color: AppColors.background,
              )),
        ],
      ),
    );
  }
}
