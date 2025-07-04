import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_text_style/app_text_style.dart';
import '../../../widgets/background_design/background_design.dart';
import '../../../widgets/common_button/common_button.dart';
import '../../../widgets/common_textfield/common_textfield.dart';
import '../login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?", style: TextStyle(color: AppColors.textLight)),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => Get.to(() => const LoginScreen()),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          CommonTextField(
                            hintText: "Enter Full Name",
                            prefixIcon: Icons.person_outline,
                            filled: false,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          Divider(height: 1, color: Colors.grey),
                          CommonTextField(
                            hintText: "Enter Email Address",
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            filled: false,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          Divider(height: 1, color: Colors.grey),
                          CommonTextField(
                            hintText: "Enter Phone Number",
                            prefixIcon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                            filled: false,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          Divider(height: 1, color: Colors.grey),
                          CommonTextField(
                            hintText: "Enter Address",
                            prefixIcon: Icons.location_on_outlined,
                            filled: false,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    CommonButton(
                      text: "Register",
                      onTap: () {

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
                        // TODO: Google login logic
                      },
                      icon: Image.asset('assets/images/Google_Icon.png', height: 22, width: 22),
                      label: const Text(
                        'Login in with Google',
                        style: TextStyle(fontSize: 15, color: AppColors.textDark),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
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
