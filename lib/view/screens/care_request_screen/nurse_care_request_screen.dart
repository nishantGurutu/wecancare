import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'nurse_care_details_screen.dart';


class NurseCareRequestsScreen extends StatefulWidget {
  const NurseCareRequestsScreen({super.key});

  @override
  State<NurseCareRequestsScreen> createState() =>
      _NurseCareRequestsScreenState();
}

class _NurseCareRequestsScreenState extends State<NurseCareRequestsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          height: 100,
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  const Spacer(),
                  const Text(
                    "Nearby Care Requests",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _filterButton("Care Type",
                    selected: selectedIndex == 0,
                    onTap: () => setState(() => selectedIndex = 0)),
                _filterButton("Distance",
                    selected: selectedIndex == 1,
                    onTap: () => setState(() => selectedIndex = 1)),
                _filterButton("Time",
                    selected: selectedIndex == 2,
                    onTap: () => setState(() => selectedIndex = 2)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                CircleAvatar(radius: 4, backgroundColor: Colors.green),
                SizedBox(width: 8),
                Text(
                  "New Booking Offer",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _bookingCard(isNew: true),
                  _bookingCard(),
                  _bookingCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String text,
      {bool selected = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF007BA7) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xFF007BA7) : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: selected ? Colors.white : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookingCard({bool isNew = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Elderly Care",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                _infoRow(FontAwesomeIcons.user, "Rahul Sharma"),
                _infoRowWithTwoIcons(
                  FontAwesomeIcons.calendarDays,
                  "Jun 10 - Jun 12",
                  FontAwesomeIcons.clock,
                  "10:00 AM - 11:00 AM",
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FontAwesomeIcons.locationPin,
                        size: 14, color: Colors.grey[700]),
                    const SizedBox(width: 5),
                    const Text(
                      "3.2 km away",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      "assets/images/map_logo.png",
                      height: 20,
                      width: 20,
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.map, size: 18),
                    ),
                  ],
                ),
                _infoRow(FontAwesomeIcons.indianRupeeSign,
                    "500/day   |   3 sessions total"),
                const SizedBox(height: 4),
                const Text(
                  "Needs help with medicine and walking",
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFEAF0FF),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: isNew
                  ? [
                _smallBottomButton("Accept", const Color(0xFF007BA7)),
                _dividerLine(),
                _smallBottomButton("Reject", const Color(0xFF007BA7)),
                _dividerLine(),
                _smallBottomButton(
                  "View Details",
                  const Color(0xFF007BA7),
                  onTap: () {
                    Get.to(() => const CareRequestDetailsScreen());
                  },
                ),
              ]
                  : [
                _smallBottomButton("Response", const Color(0xFF007BA7),
                    onTap: () {
                      _showCareResponseBottomSheet(context);
                    }),
                _dividerLine(),
                _smallBottomButton(
                  "View Details",
                   Color(0xFF007BA7),
                  onTap: () {
                    Get.to(() => const CareRequestDetailsScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallBottomButton(String label, Color color, {VoidCallback? onTap}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Color(0xFF007BA7),
        ),
      ),
    );
  }


  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          FaIcon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 6),
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

  Widget _infoRowWithTwoIcons(
      IconData icon1, String text1, IconData icon2, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon1, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Text(
            text1,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Icon(icon2, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Text(
            text2,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _dividerLine() {
    return Container(
      height: 25,
      width: 1,
      color: const Color(0xFF1F266A),
    );
  }

  void _showCareResponseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.55,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF3F6FB),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  const Text(
                    "Your Rate",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF2E3271),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.currency_rupee, color: Colors.grey),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "/day",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Availability",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF2E3271),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildSelectableBox("Days", Icons.calendar_today),
                      const SizedBox(width: 20),
                      _buildSelectableBox("Time", Icons.access_time),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Additional Note",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF2E3271),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Type additional information",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFF007BA7 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Submit Response",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSelectableBox(String label, IconData icon) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: Colors.grey[700]),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
