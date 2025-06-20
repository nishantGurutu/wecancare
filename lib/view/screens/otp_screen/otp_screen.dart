import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vcancare/view/screens/dashboard_screen/dashboard_screen.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/background_design/background_design.dart';
import '../../../widgets/common_button/common_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(color: AppColors.textDark),
                  ),
                  const SizedBox(height: 40),

                  const Text(
                    'OTP',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    'Enter the verification code sent to',
                    style: TextStyle(fontSize: 14, color: AppColors.textLight),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('+91 1234567890', style: TextStyle(fontSize: 14, color: AppColors.textDark)),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          // TODO: handle edit
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // OTP Input Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 56,
                        height: 56,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive the code?", style: TextStyle(color: AppColors.textLight)),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // TODO: Resend OTP
                        },
                        child: const Text("Resend", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  CommonButton(
                    text: "Verify",
                    onTap: () {
                      Get.to(()=> DashboardScreen());
                    },
                    color: AppColors.accent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
