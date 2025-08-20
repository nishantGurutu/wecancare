import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../modals/profile_modal.dart';

class NurseProfileController extends GetxController {
  var isLoading = false.obs;

  var profile = Rx<NurseProfile?>(null);

  Future<Map<String, dynamic>?> updateProfile(Map<String, dynamic> body) async {
    isLoading.value = true;
    try {
      var response = await http
          .post(
        Uri.parse("https://milssi.in/public/api/update-nurse-profile"),
        headers: {"Accept": "application/json"},
        body: body,
      )
          .timeout(const Duration(seconds: 15));

      debugPrint("Update Profile Response: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['status'] == true) {
          profile.value = data['data'] ?? {};
          Get.snackbar("Success", data['message'] ?? "Profile updated");
          return data;
        } else {
          Get.snackbar("Error", data['message'] ?? "Update failed");
        }
      } else {
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
      }
    } on SocketException {
      Get.snackbar("Network Error", "Please check your internet connection");
    } on TimeoutException catch (_) {
      Get.snackbar("Timeout", "Server is taking too long to respond");
    } on FormatException catch (_) {
      Get.snackbar("Error", "Invalid response format from server");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  Future<void> fetchProfile() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse("https://milssi.in/public/api/get-nurse-profile"),
        headers: {"Accept": "application/json"},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        profile.value = data['data'] ?? {}; // profile set
      }
    } catch (e) {
      debugPrint("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
