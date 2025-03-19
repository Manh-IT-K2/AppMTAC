import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DriverController extends GetxController {
  var currentDate = DateTime.now().obs;
  var daysInMonth = <DateTime>[].obs;
  var scrollController = ScrollController();

  final List<String> weekdays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

   List<String> tripTimes = List.generate(12, (index) {
    int hour = index * 2; 
    return '${hour.toString().padLeft(2, '0')}:00';
  });

  @override
  void onInit() {
    super.onInit();
    daysInMonth.value = _generateDaysInMonth(currentDate.value);
    Future.delayed(const Duration(milliseconds: 100), _scrollToToday);
  }

  List<DateTime> _generateDaysInMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  void _scrollToToday() {
    int todayIndex = daysInMonth.indexWhere((day) =>
        day.day == currentDate.value.day &&
        day.month == currentDate.value.month &&
        day.year == currentDate.value.year);

    if (todayIndex != -1) {
      double itemWidth = 13.w + 1;
      double screenWidth = 100.w;
      double scrollOffset = (todayIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
      scrollController.animateTo(
        scrollOffset.clamp(0, scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  String getWeekdayShortName(DateTime date) {
    return weekdays[date.weekday - 1];
  }
}
