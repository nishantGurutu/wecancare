import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/profile_controller.dart';

class UpdateNurseProfileScreen extends StatefulWidget {
  const UpdateNurseProfileScreen({super.key});

  @override
  State<UpdateNurseProfileScreen> createState() => _UpdateNurseProfileScreenState();
}

class _UpdateNurseProfileScreenState extends State<UpdateNurseProfileScreen> {
  final controller = Get.put(NurseProfileController());

  final licenseController = TextEditingController(text: "5454545");
  final expiryController = TextEditingController(text: "23-06-2038");
  final expController = TextEditingController(text: "5");
  final specializationController = TextEditingController(text: "eccSDCSC");
  final bioController = TextEditingController(text: "CFCSESEFCefsfAASDASDSDDSD");
  final rateController = TextEditingController(text: "56");

  File? adharFile;
  File? panFile;
  File? licenseFile;
  Map<String, File> certificateFiles = {};

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFD64541),
                Color(0xFF007BA7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SafeArea(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 17,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.black87,
                      size: 17,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle("Professional Info"),
                  buildInputCard(
                    child: Column(
                      children: [
                        buildTextField("License Number", licenseController),
                        buildTextField("License Expiry Date", expiryController),
                        buildTextField("Years of Experience", expController),
                        buildTextField("Specialization", specializationController),
                        buildTextField("Bio", bioController, maxLines: 3),
                        buildTextField("Hourly Rate", rateController),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  buildSectionTitle("Documents"),
                  buildInputCard(
                    child: Column(
                      children: [
                        buildFilePicker("Upload Aadhaar", (file) => setState(() => adharFile = file), adharFile),
                        buildFilePicker("Upload PAN", (file) => setState(() => panFile = file), panFile),
                        buildFilePicker("Upload Nursing License", (file) => setState(() => licenseFile = file), licenseFile),
                        buildFilePicker("Upload 10th Certificate", (file) => setState(() => certificateFiles["tenth"] = file), certificateFiles["tenth"]),
                        buildFilePicker("Upload 12th Certificate", (file) => setState(() => certificateFiles["twelfth"] = file), certificateFiles["twelfth"]),
                        buildFilePicker("Upload Degree", (file) => setState(() => certificateFiles["degree"] = file), certificateFiles["degree"]),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  SafeArea(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007BA7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        // var result = await controller.updateProfile(
                        //   nurseId: "4",
                        //   licenseNumber: licenseController.text,
                        //   licenseExpiryDate: expiryController.text,
                        //   yearsOfExperience: expController.text,
                        //   specialization: specializationController.text,
                        //   hourlyRate: rateController.text,
                        //   bio: bioController.text,
                        //   availability: [
                        //     {"Monday": "10:00AM - 11:00PM"},
                        //     {"Tuesday": "10:00AM - 11:00PM"},
                        //   ],
                        //   adharcard: adharFile,
                        //   pancard: panFile,
                        //   nursingLicense: licenseFile,
                        //   certificates: certificateFiles,
                        // );
                      },
                      child: Obx(() {
                        return controller.isLoading.value
                            ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : const Text(
                          "Update Profile",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            if (controller.isLoading.value)
              Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget buildInputCard({required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    );
  }

  Widget buildFilePicker(String title, Function(File) onPick, File? file) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Text(
                file != null ? file.path.split('/').last : "No file selected",
                style: const TextStyle(color: Colors.black54),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.teal),
              onPressed: () async {
                File? f = await pickFile();
                if (f != null) onPick(f);
              },
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
