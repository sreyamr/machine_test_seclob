import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../provider/profile_provider.dart';
import '../widgets/profile_field.dart';
import '../widgets/profile_stat.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
    context.read<ProfileProvider>().loadProfile();
    });

  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final data = provider.profile;

    if (data == null) return const SizedBox();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: "Profile"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(data.image),
            ),

            const SizedBox(height: 12),


            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Text(
                "Change Profile Picture",
                style: AppTextStyles.subtitle,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileStat(
                  title: "Today's Steps",
                  value: Formatters.indianNumber(data.todaySteps),
                ),

                Container(width: 1, height: 40, color: Colors.white24),

                ProfileStat(
                  title: "Total Steps",
                  value: Formatters.indianNumber(data.totalSteps),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Divider(color: Colors.white24),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1C1C2E),
                    Color(0xFF2A1E5C),
                  ],
                ),
              ),
              child: Column(
                children: [
                  ProfileField(label: "Name", value: data.name),
                  ProfileField(label: "Email", value: data.email),
                  ProfileField(label: "Phone Number", value: data.phone),
                ],
              ),
            ),

            const SizedBox(height: 30),


            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "Save Changes",
                  style: AppTextStyles.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}