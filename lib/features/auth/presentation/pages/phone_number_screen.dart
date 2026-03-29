import 'package:flutter/material.dart';
import 'package:machine_test/core/theme/app_color.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../provider/auth_provider.dart';
import 'package:country_picker/country_picker.dart';


class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  static const int _phoneLength = 10;

  String _phone = "";
  Country _selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "9123456789",
    displayName: "India",
    displayNameNoCountryCode: "India",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 20),
            _buildPhoneInput(onChanged: (value) => _phone = value),
            const Spacer(),
            AppButton(
              text: "Next",
              isLoading: provider.isLoading,
              onTap: () => _onNextTap(context, provider),
            ),
            const SizedBox(height: 12),
            _buildTermsText(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add your contact number", style: AppTextStyles.medium),
        const SizedBox(height: 6),
        Text("A verification code will be sent to this number.", style: AppTextStyles.subtitle),
      ],
    );
  }

  Widget _buildPhoneInput({required Function(String) onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkPurple, AppColors.deepBlack],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildCountryPicker(),
          const SizedBox(width: 10),
          Container(width: 1, height: 20, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              maxLength: _phoneLength,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "Enter phone number",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryPicker() {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          onSelect: (Country country) {
            setState(() => _selectedCountry = country);
          },
        );
      },
      child: Row(
        children: [
          Text(
            "${_selectedCountry.flagEmoji} +${_selectedCountry.phoneCode}",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildTermsText() {
    return const Text.rich(
      TextSpan(
        text: "By proceeding, you agree to our ",
        style: AppTextStyles.smallGrey,
        children: [
          TextSpan(text: "Terms & Conditions", style: AppTextStyles.link),
          TextSpan(text: " and "),
          TextSpan(text: "Privacy Policy", style: AppTextStyles.link),
          TextSpan(text: "."),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  bool _isValidPhone(String phone) {
    return phone.length == _phoneLength && RegExp(r'^[0-9]+$').hasMatch(phone);
  }

  Future<void> _onNextTap(BuildContext context, AuthProvider provider) async {
    if (!_isValidPhone(_phone)) {
      AppSnackbar.show(context: context, message: "Enter valid phone number");
      return;
    }

    final fullPhone = "+${_selectedCountry.phoneCode}$_phone";
    final response = await provider.sendOtp(fullPhone);

    if (response != null && response["success"] == true) {
      Navigator.pushNamed(context, AppRoutes.otp, arguments: fullPhone);
    } else {
      AppSnackbar.show(
        context: context,
        message: response?["message"] ?? provider.errorMessage ?? "Something went wrong",
      );
    }
  }
}