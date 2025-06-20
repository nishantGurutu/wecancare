import 'package:flutter/material.dart';

import '../booking_detail_screen/booking_detail_screen.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int selectedIndex = 0;

  List<String> tabs = ['Upcoming', 'Ongoing', 'Completed ', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FF),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back, color: Color(0xFF1F266A)),
                ),
                Text(
                  'MY Bookings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications_none,
                    color: Color(0xFF1F266A),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  100,
                ), // Large enough for a circle
              ),
              elevation: 2,
              child: Container(
                width: 320,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFF9A825),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Nurse ",
                          style: TextStyle(color: Colors.black87),
                        ),
                        TextSpan(
                          text: "Priya Sharma",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "\nhas marked the session as completed. Please confirm if the service was delivered.",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                bookingCard(title: "Active Care Session", isActive: true),
                const SizedBox(height: 10),
                bookingCard(title: "Upcoming Session", isActive: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bookingCard({required String title, required bool isActive}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 10,
              color: isActive ? Colors.green : Colors.blue,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: isActive ? 1 : 2,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BookingDetailScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              "assets/images/nurse.png",
                              height: 70,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Row(
                                  children: [
                                    Text(
                                      "Priya Sharma",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "📅 Jun 10 - Jun 12   🕒 10:00 - 11:00 AM",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "📍 Palam Vihar, Gurugram",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Nurse Checked Out: 4:02 PM",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6EBFF),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                            isActive
                                ? [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Mark as complete",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    child: const VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Cancel Session",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ]
                                : [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "View Details",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    child: const VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Reschedule",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
