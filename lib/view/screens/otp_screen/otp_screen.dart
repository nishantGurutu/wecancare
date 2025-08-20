import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcancare/view/screens/dashboard_screen/bottom_bar.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../widgets/common_button/common_button.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;
  final String userType;

  const OtpScreen({
    super.key,
    required this.mobile,
    required this.userType,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  final authController = Get.find<AuthController>();

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String _getOtp() {
    return _controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
          child: Column(
            children: [
              const SizedBox(height: 80),
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
                  Text(
                    widget.mobile,
                    style: const TextStyle(fontSize: 14, color: AppColors.textDark),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    height: 45,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onChanged: (value) => _onOtpChanged(value, index),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: AppColors.white,
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
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
                  const Text(
                    "Didn't receive the code?",
                    style: TextStyle(color: AppColors.textLight),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      authController.sendOtp(widget.mobile,widget.userType);
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Obx(() {
                return authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : CommonButton(
                  text: "Verify",
                  onTap: () async {
                    String otp = _getOtp();
                    if (otp.length == 6) {
                      authController.verifyOtp(
                        mobile: widget.mobile,
                        otp: otp,
                        fcmToken: "static_fcm_token_example_12875",
                        latitude: 28.7041,
                        longitude: 77.1025,
                        userType: widget.userType,
                      );
                    } else {
                      Get.snackbar("Error", "Please enter a valid 6-digit OTP");
                    }
                  },
                  color: AppColors.accent,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
