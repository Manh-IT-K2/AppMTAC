import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/controllers/nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: kBackgroundColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Trang chủ",),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Thanh toán"),
            BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: "Hộp thư"),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined), label: "Tài khoản"),
          ],
          currentIndex: navController.selectedIndex.value,
          onTap: navController.changeIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
