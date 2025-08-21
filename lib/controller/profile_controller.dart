import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../modals/profile_modal.dart';

class NurseProfileController extends GetxController {
  var isLoading = false.obs;

  var profile = Rx<NurseProfile?>(null);

  final client = dio.Dio();

  Future<bool> updateProfile({
    required String nurseId,
    required String licenseNumber,
    required String licenseExpiryDate,
    required String yearsOfExperience,
    required String specialization,
    required String hourlyRate,
    required String bio,
    required List<Map<String, String>> availability,
    File? adharCard,
    File? panCard,
    File? nursingLicense,
    File? tenthMarksheet,
    File? twelfthMarksheet,
    File? nursingMarksheet,
  }) async {
    isLoading.value = true;

    try {
      final formData = dio.FormData.fromMap({
        "nurse_id": nurseId,
        "license_number": licenseNumber,
        "license_expiry_date": licenseExpiryDate,
        "years_of_experience": yearsOfExperience,
        "specialization": specialization,
        "hourly_rate": hourlyRate,
        "bio": bio,
        "availability": jsonEncode(availability),

        if (adharCard != null)
          "adharcard": await dio.MultipartFile.fromFile(adharCard.path),
        if (panCard != null)
          "pancard": await dio.MultipartFile.fromFile(panCard.path),
        if (nursingLicense != null)
          "nursing_license": await dio.MultipartFile.fromFile(
            nursingLicense.path,
          ),
        if (tenthMarksheet != null)
          "certificate[tenth_marksheet]": await dio.MultipartFile.fromFile(
            tenthMarksheet.path,
          ),
        if (twelfthMarksheet != null)
          "certificate[twelfth_marksheet]": await dio.MultipartFile.fromFile(
            twelfthMarksheet.path,
          ),
        if (nursingMarksheet != null)
          "certificate[nursing_marksheet]": await dio.MultipartFile.fromFile(
            nursingMarksheet.path,
          ),
      });

      final response = await client.post(
        "https://milssi.in/public/api/update-nurse-profile",
        data: formData,
        options: dio.Options(headers: {"Accept": "application/json"}),
      );

      debugPrint("Update Profile Response: ${response.data}");

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['status'] == true) {
          profile.value = NurseProfile.fromJson(data['data']);
          Get.snackbar("Success", data['message'] ?? "Profile updated");
          return true;
        } else {
          Get.snackbar("Error", data['message'] ?? "Update failed");
        }
      } else {
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
      }
    } on dio.DioError catch (e) {
      Get.snackbar("Error", e.response?.data["message"] ?? e.message);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }

    return false;
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
