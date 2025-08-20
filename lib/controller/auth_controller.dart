import 'dart:io';
import 'dart:convert';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/registred_modal.dart';
import '../view/screens/dashboard_screen/bottom_bar.dart';
import '../view/screens/otp_screen/otp_screen.dart';
import '../view/screens/registration_screen/registration_screen.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var message = ''.obs;

  final String fcmToken = "your_static_fcm_token_here";
  final double latitude = 28.7041;
  final double longitude = 77.1025;

  String? registeredMobile;

  /// Register User
  Future<void> register(
      String name,
      String email,
      String mobile,
      String address,
      ) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('https://milssi.in/public/api/auth/register'),
        headers: {"Accept": "application/json"},
        body: {
          'name': name,
          'email': email,
          'mobile': mobile,
          'address': address,
        },
      );

      final data = json.decode(response.body);
      final res = RegisterUsers.fromJson(data);

      message.value = res.message;

      if (res.status) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', false);

        registeredMobile = mobile;
        Get.snackbar('Success', res.message);
        debugPrint("Navigating to OTP screen from register()");
        Get.to(() => OtpScreen(mobile: mobile, userType: 'NURSE'));
      } else {
        Get.snackbar('Error', res.message);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Send OTP
  Future<void> sendOtp(String mobile, String userType) async {
    isLoading.value = true;
    try {
      var response = await http.post(
        Uri.parse("https://milssi.in/public/api/auth/send-otp"),
        headers: {"Accept": "application/json"},
        body: {"mobile": mobile},
      ).timeout(const Duration(seconds: 15));

      var data = jsonDecode(response.body);
      debugPrint("Send OTP Response: $data");

      if (response.statusCode == 200) {
        if (data['message'] != null && data['message'].toString().contains("OTP sent")) {
          Get.snackbar("Success", data['message']);
          registeredMobile = mobile;
          debugPrint("Navigating to OTP screen from sendOtp()");
          Get.to(() => OtpScreen(mobile: mobile, userType: userType));
        } else {
          Get.snackbar("Error", data['message'] ?? "Failed to send OTP");
        }
      } else {
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
      }
    } on SocketException {
      Get.snackbar("Network Error", "Please check your internet connection");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Verify OTP
  Future<void> verifyOtp({
    required String mobile,
    required String otp,
    required String fcmToken,
    required double latitude,
    required double longitude,
    required String userType,
  }) async {
    isLoading.value = true;
    try {

      Map<String, String> body = {
        'mobile': mobile,
        'otp': otp,
        'fcm_token': fcmToken,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'user_type': userType,
      };

      var response = await http.post(
        Uri.parse("https://milssi.in/public/api/auth/verify-otp"),
        headers: {"Accept": "application/json"},
        body: body,
      );

      var data = jsonDecode(response.body);
      debugPrint("Verify OTP Response: $data");

      if (response.statusCode == 200 && data['status'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        Get.snackbar("Success", data['message'] ?? "OTP Verified");
        debugPrint("Navigating to Dashboard from verifyOtp()");
        Get.offAll(() => CustomBottomBar());
      } else {
        Get.snackbar("Error", data['message'] ?? "Invalid or expired OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Device ID
  Future<String> getDeviceId() async {
    String deviceId = "unknown_device";

    try {
      if (Platform.isAndroid) {
        const androidIdPlugin = AndroidId();
        deviceId = await androidIdPlugin.getId() ?? "";
      } else if (Platform.isIOS) {
        final deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? "";
      } else {
        deviceId = "unsupported_platform";
      }
    } catch (e) {
      deviceId = "unknown_device";
    }

    return deviceId;
  }
}
