import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareRequestScreen extends StatefulWidget {
  const CareRequestScreen({super.key});

  @override
  State<CareRequestScreen> createState() => _CareRequestScreenState();
}

class _CareRequestScreenState extends State<CareRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FF),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            decoration: BoxDecoration(
              color: Color(0xFF1F266A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Care Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add, color: Color(0xFF1F266A)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) {
                return _buildRequestCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(int index) {
    final titles = [
      "Post-surgery Care",
      "Elderly Care",
      "Post-surgery Care",
      "Post-surgery Care",
      "Post-surgery Care",
      "Post-surgery Care",
      "Post-surgery Care",
    ];

    final locations = [
      "Jaipur",
      "Schotest, Gurugram, Hariyana",
      "Schotest, Gurugram, Hariyana",
      "Schotest, Gurugram, Hariyana",
      "Schotest, Gurugram, Hariyana",
      "Schotest, Gurugram, Hariyana",
      "Schotest, Gurugram, Hariyana",
    ];

    final badges = [
      _buildResponseBadge("20 Responses", Colors.blue),
      _buildResponseBadge("0 Responses", Colors.orange),
      _buildStatusBadge("Assigned", Colors.green.shade100, Colors.green),
      _buildStatusBadge("Completed", Colors.blue.shade100, Colors.blue),
      _buildStatusBadge("Cancelled", Colors.red.shade100, Colors.red),
      _buildResponseBadge("0 Responses", Colors.orange),
      _buildResponseBadge("0 Responses", Colors.orange),
    ];

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Title Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // remove default padding
                    minimumSize: const Size(0, 0), // remove min constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                badges[index],
              ],
            ),

            const SizedBox(height: 8),
            Text(
              locations[index],
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 4),
            const Text(
              "Start Jun 10, 11:00 AM   |   2 Days",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponseBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
