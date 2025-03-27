import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mtac/data/driver_screen/item_schedule_collection_today.dart';
import 'package:sizer/sizer.dart';

class DriverController extends GetxController {
  // initial variable for time
  var currentDate = DateTime.now().obs;
  var daysInMonth = <DateTime>[].obs;
  var scrollController = ScrollController();

  // initial list weekdays
  final List<String> weekdays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  // function initial
  @override
  void onInit() {
    super.onInit();
    daysInMonth.value = _generateDaysInMonth(currentDate.value);
    Future.delayed(const Duration(milliseconds: 100), _scrollToToday);
  }

  // initial list hour away two hour
  List<String> tripTimes = List.generate(12, (index) {
    int hour = index * 2;
    return '${hour.toString().padLeft(2, '0')}:00';
  });

  // initial list day in month
  List<DateTime> _generateDaysInMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  // initial scroll to Today in center screen
  void _scrollToToday() {
    int todayIndex = daysInMonth.indexWhere((day) =>
        day.day == currentDate.value.day &&
        day.month == currentDate.value.month &&
        day.year == currentDate.value.year);

    if (todayIndex != -1) {
      double itemWidth = 13.w + 0.7;
      double screenWidth = 100.w;
      double scrollOffset =
          (todayIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
      scrollController.animateTo(
        scrollOffset.clamp(0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // get weekday name
  String getWeekdayShortName(DateTime date) {
    return weekdays[date.weekday - 1];
  }

  // schedule collection driver
  var pageControllerDriver = PageController();
  var selectedTitleDriver = "Hôm nay".obs;
  final List<String> itemScheduleCollectionDriver = [
    "Hôm nay",
    "Đã gom",
    "Chưa gom"
  ];

  // function chose item
  void selectItemScheduleDriver(String title) {
    int index = itemScheduleCollectionDriver.indexOf(title);
    if (index != -1) {
      selectedTitleDriver.value = title;
      if (pageControllerDriver.hasClients) {
        pageControllerDriver.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Update status on swipe
  void onPageChangedScheduleDriver(int index) {
    if (index >= 0 && index < itemScheduleCollectionDriver.length) {
      selectedTitleDriver.value = itemScheduleCollectionDriver[index];
    }
  }

  // initial variable schedule collection driver
  var checkedItems = <String>[].obs;

  void toggleCheck(String collectionId) {
    if (checkedItems.contains(collectionId)) {
      checkedItems.remove(collectionId);
    } else {
      checkedItems.add(collectionId);
    }
  }

  // check chose
  bool isChecked(String collectionId) {
    return checkedItems.contains(collectionId);
  }

  // delete from collectionId
  void deleteSelectedItems() {
    itemCollectionTodayDatas.removeWhere(
      (item) => checkedItems.contains(item.collectionId),
    );
    checkedItems.clear();
  }

  // 🔥memory leak
  @override
  void onClose() {
    pageControllerDriver.dispose();
    super.onClose();
  }
}
