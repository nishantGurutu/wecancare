import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBidsScreen extends StatefulWidget {
  const MyBidsScreen({super.key});

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> bids = [
    {"status": "Accepted", "color": Colors.green},
    {"status": "Pending", "color": Colors.orange},
    {"status": "Rejected", "color": Colors.red},
    {"status": "Pending", "color": Colors.orange},
    {"status": "Accepted", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: PreferredSize(
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
                      "My Bids",
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Filter Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton("All", 0),
                _buildTabButton("Pending", 1),
                _buildTabButton("Accepted", 2),
                _buildTabButton("Rejected", 3),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Filtered List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: _getFilteredBids()
                  .map((bid) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildBidCard(
                  status: bid["status"],
                  statusColor: bid["color"],
                ),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Tab Button Widget
  Widget _buildTabButton(String title, int index) {
    bool isActive = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF007BA7) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? const Color(0xFF007BA7) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  /// Returns filtered bids
  List<Map<String, dynamic>> _getFilteredBids() {
    if (selectedTab == 0) {
      // All
      return bids;
    } else if (selectedTab == 1) {
      // Pending
      return bids.where((bid) => bid["status"] == "Pending").toList();
    } else if (selectedTab == 2) {
      // Accepted
      return bids.where((bid) => bid["status"] == "Accepted").toList();
    } else if (selectedTab == 3) {
      // Rejected
      return bids.where((bid) => bid["status"] == "Rejected").toList();
    }
    return bids;
  }

  /// Bid Card UI
  Widget _buildBidCard({
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Elderly Care",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
              SizedBox(width: 4),
              Text(
                "123 maple street , 08 aug 9:00 AM",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.attach_money, size: 16, color: Colors.black54),
              SizedBox(width: 4),
              Text(
                "500/day",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.access_time, size: 16, color: Colors.black54),
              SizedBox(width: 4),
              Text(
                "Available for additional hours if needed",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Status Button
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // View Details Button
              _smallActionButton("View Details", const Color(0xFF007BA7),
                  textColor: const Color(0xFF007BA7)),
              const SizedBox(width: 8),
              // Cancel Bid Button
              _smallActionButton("Cancel Bid", Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  /// Small action button
  Widget _smallActionButton(String text, Color borderColor,
      {Color? textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent, // background transparent
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor, // border color
          width: 1.5,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor ?? borderColor,
        ),
      ),
    );
  }
}
