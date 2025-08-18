import 'package:flutter/material.dart';

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
                    color: Color(0xFF1F266A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {},
                        ),
                        const Text(
                          "My Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_none, color: Colors.white),
                          onPressed: () {},
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
                color: Colors.blue,
                decoration: TextDecoration.underline,
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
              onEdit: () {},
              items: [
                buildInfoRow(Icons.phone, "+91 9876543210"),
                buildInfoRow(Icons.email, "aparna@example.com"),
                buildInfoRow(Icons.location_on,
                    "Schoolst, Palam Vihar Sector 3, Gurugram, Haryana"),
              ],
            ),

            // Professional Info
            buildSectionTitle("Professional info"),
            buildInfoCard(
              onEdit: () {},
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
                Row(
                  children: const [
                    Icon(Icons.upload_file, size: 18, color: Colors.blue),
                    SizedBox(width: 12),
                    Text("Upload New Document",
                        style: TextStyle(fontSize: 14, color: Colors.blue)),
                  ],
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
                  buildLinkTile(Icons.help, "FAQs", Colors.orange),
                  buildLinkTile(Icons.support_agent, "Contact Support", Colors.orange),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Quick Links
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  buildLinkTile(Icons.logout, "Logout", Colors.orange),
                  buildLinkTile(Icons.description, "Terms & Condition", Colors.orange),
                  buildLinkTile(Icons.privacy_tip, "Privacy Policy", Colors.blue),
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
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {},
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
            color: Color(0xFF1F266A),
          ),
        ),
      ),
    );
  }


  // Info Card (content only + top-right edit)
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

  // Row with icon and text
  static Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.indigo),
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

  // ListTile with arrow for links
  static Widget buildLinkTile(IconData icon, String title, Color iconColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
