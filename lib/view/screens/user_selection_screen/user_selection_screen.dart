import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_text_style/app_text_style.dart';
import '../../../widgets/common_button/common_button.dart';
import '../login_screen/login_screen.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 170,
              child: Image.asset("assets/images/image4.png", width: 80),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/image3.png", width: 90),
            ),
            Positioned(
              top: 390,
              right: -5,
              child: Image.asset("assets/images/image5.png", width: 60),
            ),
            Positioned(
              top: 195,
              right: -10,
              child: Image.asset("assets/images/image1.png", width: 120),
            ),
            Positioned(
              bottom: 190,
              left: -60,
              child: Image.asset("assets/images/image1.png", width: 110),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset("assets/images/image2.png", width: 110),
            ),
            Positioned(
              bottom: 180,
              left: 100,
              child: Image.asset("assets/images/image6.png", width: 130),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  const Text('Welcome to', style: AppTextStyles.subheading),
                  const SizedBox(height: 5),
                  const Text('VCANCARE!', style: AppTextStyles.heading),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 53,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Choose Your Role to\nContinue',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.normal,
                                ),
                                const SizedBox(height: 20),
                                CommonButton(
                                  text: "I'm a Nurse",
                                  onTap:
                                      () => Get.to(() =>  LoginScreen(userType: 'NURSE',)),
                                  color: AppColors.white,
                                  textColor: AppColors.primary,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 100,
                                      child: Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Text(
                                        "Or",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                      child: Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                CommonButton(
                                  text: "I'm a Patient",
                                  onTap:
                                      () => Get.to(() =>  LoginScreen(userType: 'PATIENT',)),
                                  color: AppColors.white,
                                  textColor: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
