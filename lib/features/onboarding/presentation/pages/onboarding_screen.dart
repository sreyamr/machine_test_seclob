import 'package:flutter/material.dart';
import 'package:machine_test/core/constants/app_image.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    OnboardingPage(
      image: AppImage.onboarding1,
      title: "Track Your Daily Steps!",
      subtitle:
      "Let your phone automatically detect your steps and keep you updated in real time.",
    ),
    OnboardingPage(
      image: AppImage.onboarding2,
      title: "Earn Rewards for Every Move!",
      subtitle:
      "Walk more, unlock scratch cards, and collect exciting daily rewards.",
    ),
    OnboardingPage(
      image: AppImage.onboarding3,
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
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (_, index) => _pages[index],
          ),


          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                _buildArrowControls(),
                const SizedBox(height: 20),
                _buildActionButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _arrowButton(
          icon: Icons.arrow_back,
          enabled: _currentIndex > 0,
          onTap: () => _controller.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          ),
        ),
        _arrowButton(
          icon: Icons.arrow_forward,
          enabled: _currentIndex < _pages.length - 1,
          onTap: () => _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          ),
        ),
      ],
    );
  }


  Widget _arrowButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              enabled ? AppColors.darkPurple : Colors.transparent,
              enabled ?  AppColors.deepBlack : Colors.transparent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: enabled ? AppColors.white : AppColors.greyLowLight,
        ),
      ),
    );
  }


  Widget _buildActionButton(BuildContext context) {
    final isLast = _currentIndex == _pages.length - 1;

    return GestureDetector(
      onTap: () {
        if (isLast) {
          Navigator.pushNamed(context, AppRoutes.welcome);
        } else {
          _controller.nextPage(
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
        child: Center(
          child: Text(
             "Get Started" ,
            style: AppTextStyles.semiBold,
          ),
        ),
      ),
    );
  }
}