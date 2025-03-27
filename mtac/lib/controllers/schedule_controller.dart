import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  // initial variable
  var selectedTitle = "Tất cả".obs;
  var pageController = PageController();

  // list item
  final List<String> items = ["Tất cả", "Nguy hại", "Tái chế", "Công nghiệp"];

  // function chose item
  void selectItem(String title) {
    int index = items.indexOf(title);
    if (index != -1) {
      selectedTitle.value = title;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Update status on swipe
  void onPageChanged(int index) {
    selectedTitle.value = items[index];
  }

  // schedule collection driver
  var selectedTitleDriver = "Hôm nay".obs;
  final List<String> itemScheduleCollectionDriver = ["Hôm nay", "Đã gom", "Chưa gom"];

  // function chose item
  void selectItemScheduleDriver(String title) {
    int index = itemScheduleCollectionDriver.indexOf(title);
    if (index != -1) {
      selectedTitleDriver.value = title;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Update status on swipe
  void onPageChangedScheduleDriver(int index) {
    selectedTitleDriver.value = itemScheduleCollectionDriver[index];
  }

  // initial varible schedule collection driver
  var isChecked = false.obs;
  void toggleCheck(){
    isChecked.value = !isChecked.value;
  }
  
}
