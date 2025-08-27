import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../modals/add_request_modal.dart';

class CareRequestController extends GetxController {
  var isLoading = false.obs;
  CareRequestResponse? careRequestResponse;

  Future<void> sendCareRequest(Map<String, dynamic> body) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse("https://milssi.in/public/api/add-care-request"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        careRequestResponse = CareRequestResponse.fromJson(data);
        Get.snackbar("Success", careRequestResponse?.message ?? "Request Success");
      } else {
        Get.snackbar("Error", "Failed: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
