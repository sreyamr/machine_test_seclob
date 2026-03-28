import 'package:flutter/material.dart';
import 'package:machine_test/core/constants/app_image.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final pages = [
    const OnboardingPage(
      image: AppImage.onboarding1,
      title: "Track Your Daily Steps!",
      subtitle:
      "Let your phone automatically detect your steps and keep you updated in real time.",
    ),
    const OnboardingPage(
      image: AppImage.onboarding2,
      title: "Earn Rewards for Every Move!",
      subtitle:
      "Walk more, unlock scratch cards, and collect exciting daily rewards.",
    ),
    const OnboardingPage(
      image: AppImage.onboarding2,
      title: "Boost Your Progress & Stay Motivated!",
      subtitle:
      "Join challenges, view insights, and level up your fitness journey effortlessly.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (_, index) => pages[index],
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                        (index) => Container(
                      margin: const EdgeInsets.all(4),
                      width: currentIndex == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? AppColors.white
                            : AppColors.greyText,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    if (currentIndex < pages.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Center(
                      child: Text("Get Started",style:AppTextStyles.button),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}