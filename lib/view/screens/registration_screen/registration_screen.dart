import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/common_button/common_button.dart';
import '../../../widgets/common_textfield/common_textfield.dart';
import '../login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final String mobile;
  final String userType;
  RegistrationScreen({super.key, required this.mobile, required this.userType});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

  final registerController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// 🔹 Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🔹 Foreground
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20, // ✅ keyboard ke liye space
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center( // ✅ Center content vertically
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // ✅ Centering
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              const Text(
                                "Already have an account?",
                                style: TextStyle(color: AppColors.textLight),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () => Get.to(() => LoginScreen(userType: userType,)),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),

                          /// 🔹 Form container
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
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
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
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
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
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
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                                const Divider(height: 1, color: Colors.grey),
                                CommonTextField(
                                  controller: addressController,
                                  hintText: "Enter Address",
                                  prefixIcon: Icons.location_on_outlined,
                                  filled: false,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          Obx(() {
                            return registerController.isLoading.value
                                ? const CircularProgressIndicator()
                                : CommonButton(
                              text: "Register",
                              onTap: () {
                                registerController.register(
                                  nameController.text.trim(),
                                  emailController.text.trim(),
                                  mobileController.text.trim(),
                                  addressController.text.trim(),
                                );
                              },
                              color: AppColors.accent,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
