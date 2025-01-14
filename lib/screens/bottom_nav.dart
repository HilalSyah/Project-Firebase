import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'favorite_screen.dart';
import 'profile_screen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);

  final RxInt currentIndex = 0.obs;
  final profileScreen = Get.put(ProfileFireBase()); // Inisialisasi di luar screens

  final screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileFireBase(), // Gunakan instance yang sudah diinisialisasi
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[currentIndex.value]),
      bottomNavigationBar: Container(
        height: 93,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: Icons.home_rounded,
                    label: 'Home',
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: Icons.favorite_rounded,
                    label: 'Favorites',
                    index: 1,
                  ),
                  _buildNavItem(
                    icon: Icons.person_rounded,
                    label: 'Profile',
                    index: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex.value == index;

    return GestureDetector(
      onTap: () => changePage(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isSelected ? 8 : 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF005B96) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade600,
              size: isSelected ? 28 : 24,
            ),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


