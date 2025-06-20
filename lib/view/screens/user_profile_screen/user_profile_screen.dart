import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔷 Header with rounded bottom
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F266A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back, color: Color(0xFF1F266A)),
                      ),
                      Text(
                        "My Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.notifications_none, color: Color(0xFF1F266A)),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: -70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("assets/images/nurse.png"),
                        ),
                        Positioned(
                          top: 60,
                          child: Container(
                            height: 35,
                            width: 40,
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Icon(Icons.edit, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 90),

            const Text(
              "Aparna Asha",
              style: TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF9A825),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("⭐ Standard Member",
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 6),
            const Text(
              "Upgrade Your Plan →",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  decoration: TextDecoration.underline),
            ),

            const SizedBox(height: 20),

            // 🔹 Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.black54),
                        SizedBox(width: 10),
                        Text("+91 987654321", style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.email_outlined, color: Colors.black54),
                        SizedBox(width: 10),
                        Text("aparnaasha@gmail.com",
                            style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.black54),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                              "Schotest, Palam Vihar, Sector 3, Gurugram, Hariyana",
                              style: TextStyle(fontSize: 13)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            buildSectionTitle("Quick Links"),
            buildTile(Icons.calendar_month, "My Bookings"),
            buildTile(Icons.reviews, "My Reviews"),

            buildSectionTitle("Help & Support"),
            buildTile(Icons.question_answer, "FAQs"),
            buildTile(Icons.support_agent, "Contact Support"),

            buildSectionTitle("Legal"),
            buildTile(Icons.logout, "Logout"),
            buildTile(Icons.library_books_outlined, "Terms & Condition"),
            buildTile(Icons.privacy_tip_outlined, "Privacy Policy"),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF1F266A),
          ),
        ),
      ),
    );
  }

  Widget buildTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: const Color(0xFFF9A825)),
            title: Text(title,
                style:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
