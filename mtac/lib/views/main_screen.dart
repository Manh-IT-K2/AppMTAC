import 'package:flutter/material.dart';
import 'package:mtac/views/account_screen.dart';
import 'package:mtac/views/home_screen.dart';
import 'package:mtac/views/mailbox_screen.dart';
import 'package:mtac/views/payment_screen.dart';
import 'package:mtac/widgets/bottom_nav_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          PaymentScreen(),
          MailboxScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
