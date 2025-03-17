// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MapController extends GetxController {
//   var selectedTitle = "Tất cả".obs;
//   var pageController = PageController();

//   final List<String> items = ["Tất cả", "Nguy hại", "Tái chế", "Công nghiệp"];

//   void selectItem(String title) {
//     int index = items.indexOf(title);
//     if (index != -1) {
//       selectedTitle.value = title;
//       pageController.jumpToPage(index); // Chuyển trang khi chọn item
//     }
//   }

//   void onPageChanged(int index) {
//     selectedTitle.value = items[index]; // Cập nhật trạng thái khi vuốt trang
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  var selectedTitle = "Tất cả".obs;
  var pageController = PageController(); // Controller điều khiển PageView

  final List<String> items = ["Tất cả", "Nguy hại", "Tái chế", "Công nghiệp"];

  void selectItem(String title) {
    int index = items.indexOf(title);
    if (index != -1) {
      selectedTitle.value = title;
      pageController.animateToPage( // Chuyển trang có animation
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    selectedTitle.value = items[index]; // Cập nhật trạng thái khi vuốt
  }
}
