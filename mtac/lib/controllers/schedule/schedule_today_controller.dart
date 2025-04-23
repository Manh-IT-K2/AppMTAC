import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/models/schedule_collection_model.dart';
import 'package:mtac/services/schedule/schedule_collection_service.dart';

class ScheduleController extends GetxController {
  /* schedule collection today */
  var pageControllerScheduleToday = PageController();
  var selectedTitleScheduleToday = "Hôm nay".obs;
  // initial variable schedule collection today
  var checkedItems = <int>[].obs;
  final List<String> itemScheduleCollectionDriver = [
    "Hôm nay",
    "Đã gom",
    "Chưa gom"
  ];

  // function initial
  @override
  void onInit() {
    super.onInit();
    fetchScheduleToday();
  }

  // depose
  @override
  void onClose() {
    pageControllerScheduleToday.dispose();
    super.onClose();
  }

  // function chose item schedule today
  void selectItemScheduleToday(String title) {
    int index = itemScheduleCollectionDriver.indexOf(title);
    if (index != -1) {
      selectedTitleScheduleToday.value = title;
      if (pageControllerScheduleToday.hasClients) {
        pageControllerScheduleToday.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Update status on swipe schedule today
  void onPageChangedScheduleToday(int index) {
    if (index >= 0 && index < itemScheduleCollectionDriver.length) {
      selectedTitleScheduleToday.value = itemScheduleCollectionDriver[index];
    }
  }

  // tranfer chose
  void toggleCheck(int id) {
    if (checkedItems.contains(id)) {
      checkedItems.remove(id);
    } else {
      checkedItems.add(id);
    }
  }

  // check chose
  bool isChecked(int id) {
    return checkedItems.contains(id);
  }

  // delete from collectionId
  void deleteSelectedItems() async {
    if (checkedItems.isEmpty) {
      Get.snackbar("Thông báo", "Chưa chọn mục nào để xoá");
      return;
    }

    try {
      // Xoá trên server từng item
      for (int id in checkedItems) {
        await ScheduleCollectionService().deleteScheduleCollection(id);
      }

      // Xoá local trong danh sách gốc
      allItems.removeWhere((item) => checkedItems.contains(item.id));

      // Lọc lại dữ liệu
      filterData();

      // Xoá danh sách mục đã chọn
      checkedItems.clear();

      // Hiển thị thông báo thành công
      Get.snackbar("Thành công", "Đã xoá các mục đã chọn");
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể xoá: $e");
    }
  }

  // chose all
  // void toggleSelectAll(List<String> allCollectionIds) {
  //   if (checkedItems.length == allCollectionIds.length) {
  //     checkedItems.clear();
  //   } else {
  //     checkedItems.assignAll(allCollectionIds);
  //   }
  // }

  // check chose all
  bool isAllSelected(List<String> allCollectionIds) {
    return checkedItems.length == allCollectionIds.length;
  }

  // filter
  // list original
  var allItems = <ScheduleCollectionModel>[].obs;
  Future<void> fetchScheduleToday() async {
    try {
      final result = await ScheduleCollectionService()
          .fetchTodaySchedule(); // service bạn đã tạo
      allItems.assignAll(result); // cập nhật list
      filterData(); // lọc sau khi load xong
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể tải dữ liệu: $e');
    }
  }

  var isLoading = false.obs;
  // status filter current
  var selectedFilter = "null".obs;

  // list filtered
  var filteredItems = <ScheduleCollectionModel>[].obs;

  // function filter by status
  void filterData() async {
    // start
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    List<ScheduleCollectionModel> tempList = List.from(allItems);

    // filter by status "Đã gom" or "Chưa gom"
    if (selectedTitleScheduleToday.value == "Đã gom") {
      tempList = tempList
          .where((item) => !item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedTitleScheduleToday.value == "Chưa gom") {
      tempList = tempList
          .where((item) => item.timeCollection.contains("Chưa thu gom"))
          .toList();
    }

    // filter by status "Khoáng" hoặc "Cân ký" of Today
    if (selectedFilter.value == "Khoáng") {
      tempList = tempList.where((item) => item.status == true).toList();
    } else if (selectedFilter.value == "Cân ký") {
      tempList = tempList.where((item) => item.status == false).toList();
    }

    // filter by status "Khoáng" hoặc "Cân ký" of "Đã gom" or "Chưa gom"
    if (selectedFilter.value == "Khoáng" &&
        selectedTitleScheduleToday.value == "Đã gom") {
      tempList = tempList
          .where((item) =>
              item.status == true &&
              !item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedFilter.value == "Cân ký" &&
        selectedTitleScheduleToday.value == "Đã gom") {
      tempList = tempList
          .where((item) =>
              item.status == false &&
              !item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedFilter.value == "Cân ký" &&
        selectedTitleScheduleToday.value == "Chưa gom") {
      tempList = tempList
          .where((item) =>
              item.status == false &&
              item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedFilter.value == "Khoáng" &&
        selectedTitleScheduleToday.value == "Chưa gom") {
      tempList = tempList
          .where((item) =>
              item.status == true &&
              item.timeCollection.contains("Chưa thu gom"))
          .toList();
    }

    // update list filtered
    filteredItems.value = tempList;
    // end
    isLoading.value = false;
  }

  // update filter
  void updateFilter(String filter) {
    selectedFilter.value = filter;
    filterData();
  }

  //
  var isMenuOpen = false.obs;
  Offset dragStart = Offset.zero;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  void onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  void onDragUpdate(DragUpdateDetails details) {
    double dragDistance = details.globalPosition.dx - dragStart.dx;

    if (isMenuOpen.value && dragDistance > 50) {
      toggleMenu();
    }
  }

}