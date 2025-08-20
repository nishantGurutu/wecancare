import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vcancare/controller/auth_controller.dart';
import 'package:vcancare/view/screens/otp_screen/otp_screen.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/common_button/common_button.dart';
import '../../../widgets/common_textfield/common_textfield.dart';
import '../registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  final String userType;
  LoginScreen({super.key,required this.userType});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// 🔹 Background
          Container(
            width: double.infinity,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 33.png'),
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
                    left: 16.w,
                    right: 16.w,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: AppColors.textLight),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () => Get.to(() => RegistrationScreen(mobile: phoneController.text.trim(),userType: userType,)),
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

                          CommonTextField(
                            controller: phoneController,
                            hintText: "Enter Phone Number",
                            prefixIcon: Icons.call,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 25),

                          Obx(() {
                            return CommonButton(
                              text: authController.isLoading.value
                                  ? "Please wait..."
                                  : "Login",
                              onTap: () {
                                if (phoneController.text.isEmpty) {
                                  Get.snackbar("Error", "Please enter phone number");
                                  return;
                                }
                                authController.sendOtp(phoneController.text,userType);
                              },
                              color: AppColors.accent,
                            );

                          }),
                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 130,
                                child: Divider(color: Colors.grey, thickness: 1),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Or",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                child: Divider(color: Colors.grey, thickness: 1),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),

                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/Google_Icon.png',
                              height: 22,
                              width: 22,
                            ),
                            label: const Text(
                              'Login in with Google',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.textDark,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              elevation: 2,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 55,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
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
