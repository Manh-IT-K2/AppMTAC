import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/user/login_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 10.h,),
        GestureDetector(
            onTap: () {
              controller.logOut();
            },
            child: Text(
              "Log Out",
              style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
            )),
      ],
    ));
  }
}
