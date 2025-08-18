import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/common_button/common_button.dart';
import '../../../widgets/common_textfield/common_textfield.dart';
import '../login_screen/login_screen.dart';
import '../otp_screen/otp_screen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

  final registerController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                    const Text("Already have an account?",
                        style: TextStyle(color: AppColors.textLight)),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Get.to(() =>  LoginScreen()),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: AppColors.primary,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2)),
                    ],
                  ),
                  child: Column(
                    children: [
                      CommonTextField(
                        controller: nameController,
                        hintText: "Enter Full Name",
                        prefixIcon: Icons.person_outline,
                        filled: false,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      CommonTextField(
                        controller: emailController,
                        hintText: "Enter Email Address",
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        filled: false,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      CommonTextField(
                        controller: mobileController,
                        hintText: "Enter Phone Number",
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        filled: false,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      CommonTextField(
                        controller: addressController,
                        hintText: "Enter Address",
                        prefixIcon: Icons.location_on_outlined,
                        filled: false,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Obx(() {
                  return registerController.isLoading.value
                      ? const CircularProgressIndicator()
                      :
                  CommonButton(
                    text: "Register",
                    onTap: () {
                      registerController.register(
                          nameController.text,
                          emailController.text,
                          mobileController.text,
                          addressController.text);
                    },
                    color: AppColors.accent,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
