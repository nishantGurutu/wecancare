import 'package:flutter/material.dart';

class CareRequestDetailsScreen extends StatelessWidget {
  const CareRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F266A),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Care Request Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Elderly Care Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Elderly Care",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF2E3271),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      const Text(
                        "Jun 10 - Jun 12",
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      const Text(
                        "10:00 AM - 11:00 AM",
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      const Text(
                        "3.2 km away",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        "assets/images/map_logo.png",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline, size: 16, color: Colors.grey),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Needs help with medicine and walking",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Ratings & Reviews",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color(0xFF2E3271),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildReview(
                    "Very caring and punctual. Helped with mobility exercises for my father.",
                    "Mr. Gupta",
                  ),
                  const SizedBox(height: 18),
                  _buildReview(
                    "Very caring and punctual. Helped with mobility exercises for my father.",
                    "Mr. Gupta",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Your Rate
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
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(Icons.currency_rupee, color: Colors.grey,size: 15,),
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

            const SizedBox(height: 30),

            // Availability
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
                _buildSelectableBox("Days",Icons.calendar_today),
                const SizedBox(width: 20),
                _buildSelectableBox("Time",Icons.access_time),
              ],
            ),

            const SizedBox(height: 30),

            // Additional Note
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
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Type additional information",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Submit Button
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3AB6FF),
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
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReview(String comment, String user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.star, size: 18, color: Color(0xFFFFA000)),
            Icon(Icons.star, size: 18, color: Color(0xFFFFA000)),
            Icon(Icons.star, size: 18, color: Color(0xFFFFA000)),
            Icon(Icons.star, size: 18, color: Color(0xFFFFA000)),
            Icon(Icons.star_half, size: 18, color: Color(0xFFFFA000)),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "\"$comment\"",
          style: const TextStyle(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "- $user",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectableBox(String label,IconData icon) {
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
            Text(
              label,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(width: 50),
            Icon(icon, size: 18, color: Colors.grey[700]),

          ],
        ),
      ),
    );
  }
}
