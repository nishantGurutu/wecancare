import 'package:flutter/material.dart';
import 'package:vcancare/view/screens/post_requirement_screen/post_requirement_screen.dart';

import '../booking_screen/booking_screen.dart';
import '../care_request_screen/care_request_screen.dart';
import '../home_screen/nurse_home_screen.dart';
import '../user_profile_screen/user_profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    NurseHomeScreen(),
    CareRequestScreen(),
    PostRequirementScreen(),
    BookingsScreen(),
    UserProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FF),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(index: _currentIndex, children: _screens),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => _onTabSelected(2),
        backgroundColor: const Color(0xFF1F266A),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left icons
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_home_sharp,
                      size: 30,
                      color:
                          _currentIndex == 0
                              ?  Colors.grey
                              : Colors.grey,
                    ),
                    onPressed: () => _onTabSelected(0),
                  ),
                  IconButton(
                    icon: Icon(
                      size: 30,
                      Icons.medical_services_outlined,
                      color:
                          _currentIndex == 1
                              ? Colors.grey
                              : Colors.grey,
                    ),
                    onPressed: () => _onTabSelected(1),
                  ),
                ],
              ),

              // Right icons
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.assignment_outlined,
                      size: 30,
                      color:
                          _currentIndex == 3
                              ? Colors.grey
                              : Colors.grey,
                    ),
                    onPressed: () => _onTabSelected(3),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_pin_outlined,
                      size: 30,
                      color:
                          _currentIndex == 4
                              ? Colors.grey
                              : Colors.grey,
                    ),
                    onPressed: () => _onTabSelected(4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
