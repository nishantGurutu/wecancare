import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcancare/view/screens/otp_screen/otp_screen.dart';
import 'package:vcancare/widgets/background_design/background_design.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/common_button/common_button.dart';
import '../../../widgets/common_textfield/common_textfield.dart';
import '../registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            const BackgroundDesign(),

            // 🔹 Blur overlay
            Positioned.fill(
              child: Container(
                color: AppColors.white.withOpacity(0.1),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const SizedBox(),
                ),
              ),
            ),

            // 🔹 Main UI
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign in to your\nAccount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(color: AppColors.textLight)),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => Get.to(() => const RegistrationScreen()),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    const CommonTextField(
                      hintText: "Enter Phone Number",
                      prefixIcon: Icons.call,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 25),

                    CommonButton(
                      text: "Login",
                      onTap: () {
                        Get.to(() => OtpScreen());
                      },
                      color: AppColors.accent,
                    ),
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 130, child: Divider(color: Colors.grey, thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Or", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
                        ),
                        SizedBox(width: 130, child: Divider(color: Colors.grey, thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement Google login
                      },
                      icon: Image.asset(
                        'assets/images/Google_Icon.png',
                        height: 22,
                        width: 22,
                      ),
                      label: const Text(
                        'Login in with Google',
                        style: TextStyle(fontSize: 15, color: AppColors.textDark),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
