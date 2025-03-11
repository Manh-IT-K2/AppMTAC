import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/nav_controller.dart';
import 'package:mtac/views/account_screen.dart';
import 'package:mtac/views/home_screen.dart';
import 'package:mtac/views/mailbox_screen.dart';
import 'package:mtac/views/payment_screen.dart';
import 'package:mtac/widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavController navController = Get.put(NavController());

  final List<Widget> screens = [
    HomeScreen(),
    const PaymentScreen(),
    const MailboxScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => screens[navController.selectedIndex.value]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
