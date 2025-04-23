import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/menu_main_controller.dart';

class BaseWillPopWidget extends StatelessWidget {
  final Widget child;

  const BaseWillPopWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          Get.find<MenuMainController>().backIndex();
        }
      },
      child: child,
    );
  }
}
