import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FF),
      body: Column(
        children: [
          // 🔷 Custom AppBar
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
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
                  "Booking Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.notifications_none, color: Color(0xFF1F266A)),
                ),
              ],
            ),
          ),

          // 🔹 Nurse Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/nurse.png",
                      width: 70,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Priya Sharma",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        SizedBox(height: 4),
                        Text("Elderly care Expert    ⭐ 4.5",
                            style: TextStyle(fontSize: 13)),
                        SizedBox(height: 4),
                        Text("🎓 BSc Nursing    🧑‍⚕️ 5+ Years Experience",
                            style: TextStyle(fontSize: 12)),
                        Text("📍 Schotest, Palam Vihar, Gurugram, Hariyana",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          /// Booking summary

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Booking Summary",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F266A))),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 10, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Upcoming", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                          SizedBox(width: 10),
                          Text("Jun 10 - Jun 12",style: TextStyle(fontSize: 12),),
                          SizedBox(width: 2),
                          Icon(Icons.access_time, size: 16, color: Colors.grey),
                          SizedBox(width: 2),
                          Text("10:00 AM - 11:00 AM",style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text("Schotest, Palam Vihar, Gurugram, Hariyana",style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.currency_rupee, size: 16, color: Colors.grey),
                          SizedBox(width: 6),
                          Text("400/day * 3 days = ₹1200",style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //  Stay Timeline
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Stay Timeline",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F266A))),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.login, color: Colors.green),
                          SizedBox(width: 8),
                          Text("Check - In  : ",style: TextStyle(fontSize: 12)),
                          Text("10:01 AM   |  5 Jun 2025",style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 8),
                          Text("Check - Out : ",style: TextStyle(fontSize: 12)),
                          Text("10:01 AM   |  5 Jun 2025",style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
