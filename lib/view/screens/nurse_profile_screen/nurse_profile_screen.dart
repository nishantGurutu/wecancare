import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:vcancare/view/screens/nurse_profile_screen/update_nurse_profile.dart';

import '../../../controller/profile_controller.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 110,
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

                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const Text(
                          "My Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
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

                // Profile Image
                Positioned(
                  top: 90,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/nurse.png"),
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue,
                        child: const Icon(Icons.edit, size: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            const Text(
              "Aparna Asha",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF007BA7),
                // decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Verified Nurse",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.verified, size: 16, color: Colors.white),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Rating: 4.8 (reviews)",
                  style: TextStyle(color: Colors.blue, fontSize: 13),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, size: 16, color: Colors.orange),
              ],
            ),

            const SizedBox(height: 20),

            buildSectionTitle("Contact info"),
            buildInfoCard(
              onEdit: () {
                _showEditBottomSheet(context, "Contact Info", [
                  {
                    "label": "Phone",
                    "controller": TextEditingController(text: "+91 9876543210"),
                  },
                  {
                    "label": "Email",
                    "controller": TextEditingController(text: "aparna@example.com"),
                  },
                  {
                    "label": "Address",
                    "controller": TextEditingController(text: "Schoolst, Palam Vihar Sector 3, Gurugram, Haryana"),
                  },
                ]);
              },
              items: [
                buildInfoRow(Icons.phone, "+91 9876543210"),
                buildInfoRow(Icons.email, "aparna@example.com"),
                buildInfoRow(Icons.location_on,
                    "Schoolst, Palam Vihar Sector 3, Gurugram, Haryana"),
              ],
            ),


            buildSectionTitle("Professional info"),
            buildInfoCard(
              onEdit: () {
                _showEditBottomSheet(context, "Professional Info", [
                  {"label": "Qualification", "controller": TextEditingController(text: "BSc Nursing")},
                  {"label": "Experience", "controller": TextEditingController(text: "5 Years")},
                  {"label": "Rate", "controller": TextEditingController(text: "₹900/day")},
                  {"label": "Availability", "controller": TextEditingController(text: "Mon-Fri: 10 AM - 6 PM")},
                ]);
              },
              items: [
                buildInfoRow(Icons.school, "Qualifications: BSc Nursing"),
                buildInfoRow(Icons.work, "Experience: 5 Years"),
                buildInfoRow(Icons.currency_rupee, "Rate: ₹900/day"),
                buildInfoRow(Icons.access_time, "Mon-Fri: 10 AM - 6 PM"),
              ],
            ),


            // Documents
            buildSectionTitle("Documents"),
            buildInfoCard(
              onEdit: () {},
              items: [
                buildInfoRow(Icons.insert_drive_file, "Nursing License"),
                buildInfoRow(Icons.insert_drive_file, "ID Proof"),
                buildInfoRow(Icons.insert_drive_file, "Certificates"),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                    await FilePicker.platform.pickFiles(type: FileType.any);
                    if (result != null) {
                      File file = File(result.files.single.path!);
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.upload_file, size: 18, color: Colors.blue),
                      SizedBox(width: 12),
                      Text(
                        "Upload New Document",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            // Bank Details
            buildSectionTitle("Bank Details"),
            buildInfoCard(
              onEdit: () {},
              items: [
                buildInfoRow(Icons.account_balance,
                    "Bank Account : HDFC Bank   Contact Vcancare"),
              ],
            ),

            const SizedBox(height: 10),

            // Help & Support
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  buildLinkTile(Icons.help, "FAQs", Color(0xFF007BA7)),
                  buildLinkTile(Icons.support_agent, "Contact Support", Color(0xFF007BA7)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Quick Links
            buildSectionTitle("Quick Links"),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  buildLinkTile(Icons.logout, "Logout", Color(0xFF007BA7)),
                  buildLinkTile(Icons.description, "Terms & Condition", Color(0xFF007BA7)),
                  buildLinkTile(Icons.privacy_tip, "Privacy Policy", Color(0xFF007BA7)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF007BA7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    Get.to(() => const UpdateNurseProfileScreen());
                  },

                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 12, bottom: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }


  static Widget buildInfoCard({
    required List<Widget> items,
    VoidCallback? onEdit,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color(0xFFF1F4FF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items,
            ),
            if (onEdit != null)
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onEdit,
                  child: const Icon(Icons.edit, size: 18, color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Color(0xFF007BA7)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildLinkTile(IconData icon, String title, Color iconColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }


  void _showEditBottomSheet(BuildContext context, String section, List<Map<String, dynamic>> fields) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Edit $section",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Dynamic TextFields
              ...fields.map((field) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: field["controller"],
                    decoration: InputDecoration(
                      labelText: field["label"],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              }).toList(),

              const SizedBox(height: 10),
              SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007BA7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }




}
