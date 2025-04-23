import 'package:flutter/material.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      // turn off animation press
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: kBackgroundColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Trang chủ"),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Thanh toán"),
            BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: "Hộp thư"),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined), label: "Tài khoản"),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          iconSize: 5.w,
          selectedLabelStyle: PrimaryFont.bodyTextMedium().copyWith(color: Colors.grey),
          unselectedLabelStyle: PrimaryFont.bodyTextMedium().copyWith(color: kPrimaryColor),
          enableFeedback: false,
        ),
      ),
    );
  }
}
