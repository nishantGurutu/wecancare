import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vcancare/view/screens/booking_screen/booking_screen.dart';
import 'package:vcancare/view/screens/card_request_screen/card_request_screen.dart';
import 'package:vcancare/view/screens/home_screen/home_screen.dart';
import 'package:vcancare/view/screens/post_requirement_screen/post_requirement_screen.dart';
import 'package:vcancare/view/screens/user_profile_screen/user_profile_screen.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  RxInt selectedIndex = 0.obs;

  final List<Widget> _screens = const [
    HomeScreen(),
    CardRequestScreen(),
    PostRequirementScreen(),
    BookingsScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: selectedIndex.value,
                children: _screens,
              ),
            ),
          ],
        );
      }),
      backgroundColor: const Color(0xFFF1F6FF),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 65.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(19.r),
              topRight: Radius.circular(19.r),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(31, 101, 101, 101),
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  'assets/svg/home_and_garden.svg',
                  0,
                  'assets/svg/home_and_garden_active.svg',
                ),
                _buildNavItem(
                  'assets/svg/add_location.svg',
                  1,
                  'assets/svg/add_location_active.svg',
                ),
                GestureDetector(
                  onTap: () {
                    selectedIndex.value = 2;
                  },
                  child: Container(
                    height: 53.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),

                _buildNavItem(
                  'assets/svg/assignment_add.svg',
                  3,
                  'assets/svg/assignment_add_active.svg',
                ),
                _buildNavItem(
                  'assets/svg/account_box.svg',
                  4,
                  'assets/svg/account_box (1).svg',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(String svgPicture, int index, String activeImage) {
    bool isSelected = selectedIndex.value == index;
    return GestureDetector(
      onTap: () {
        selectedIndex.value = index;
      },
      child: SizedBox(
        height: 50.h,
        width: 65.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(isSelected ? activeImage : svgPicture),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 2),
                width: 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
