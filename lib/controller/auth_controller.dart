import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../modals/registred_modal.dart';
import '../view/screens/dashboard_screen/bottom_bar.dart';
import '../view/screens/otp_screen/otp_screen.dart';

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
        await prefs.setBool('isLoggedIn', true);

        registeredMobile = mobile;
        Get.snackbar('Success', res.message);
        Get.to(() => OtpScreen(mobile: mobile));
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
  Future<void> sendOtp(String mobile) async {
    isLoading.value = true;
    try {
      var response = await http.post(
        Uri.parse("https://milssi.in/public/api/auth/send-otp"),
        headers: {"Accept": "application/json"},
        body: {"mobile": mobile},
      );

      var data = jsonDecode(response.body);
      debugPrint("Send OTP Response: $data");

      if (response.statusCode == 200 && data['status'] == true) {
        Get.snackbar("Success", "OTP sent successfully");
        Get.to(CustomBottomBar());
      } else {
        Get.snackbar("Error", data['message'] ?? "Failed to send OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp({
    required String mobile,
    required String otp,
    String? deviceId,
    String? fcmToken,
    double? latitude,
    double? longitude,
  }) async {
    isLoading.value = true;
    try {
      String deviceId = await getDeviceId();

      Map<String, String> body = {
        'mobile': mobile,
        'otp': otp,
        'device_id': deviceId,
        'fcm_token': fcmToken.toString(),
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      };

      var response = await http.post(
        Uri.parse("https://milssi.in/public/api/auth/verify-otp"),
        headers: {"Accept": "application/json"},
        body: body,
      );

      var data = jsonDecode(response.body);
      debugPrint("Verify OTP Response: $data");

      if (response.statusCode == 200 && data['status'] == true) {
        Get.snackbar("Success", data['message'] ?? "OTP Verified");
        Get.offAll(() =>  CustomBottomBar());
      } else {
        Get.snackbar("Error", data['message'] ?? "Invalid or expired OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }


  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    String deviceId = "";

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id ?? "";
      } else if (Platform.isIOS) {
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



