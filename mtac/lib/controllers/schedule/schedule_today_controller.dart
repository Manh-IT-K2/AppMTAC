import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/models/schedule/cost_model.dart';
import 'package:mtac/models/schedule/schedule_collection_model.dart';
import 'package:mtac/services/schedule/schedule_collection_service.dart';

class ScheduleController extends GetxController {
  /* schedule collection today */
  // list original
  var allItems = <ScheduleCollectionModel>[].obs;
  var isLoading = false.obs;
  // status filter current
  var selectedFilter = "null".obs;
  // list filtered
  var filteredItems = <ScheduleCollectionModel>[].obs;

  // add cost
  RxList<CostModel> costList = <CostModel>[].obs;

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

  // Function fetchScheduleToday from service
  Future<void> fetchScheduleToday() async {
    try {
      final result = await ScheduleCollectionService().fetchTodaySchedule();
      allItems.assignAll(result);
      filterData();
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể tải dữ liệu: $e');
    }
  }

  // Function addCostScheduleCollection from service
  Future<void> addCostScheduleCollection(CostModel model) async {
    try {
      await ScheduleCollectionService().addCostScheduleCollection(model);
      //
      costList.add(model);
      Get.snackbar('Thành công', 'Đã thêm chi phí!',
          colorText: Colors.green,
          backgroundColor: Colors.green.withOpacity(0.1),
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar('Lỗi', e.toString(),
          colorText: Colors.green,
          backgroundColor: Colors.green.withOpacity(0.1),
          snackPosition: SnackPosition.TOP);
    }
  }

  // delete from collectionId from service
  void deleteSelectedItems() async {
    if (checkedItems.isEmpty) {
      Get.snackbar("Thông báo", "Chưa chọn mục nào để xoá");
      return;
    }
    try {
      for (int id in checkedItems) {
        await ScheduleCollectionService().deleteScheduleCollection(id);
      }
      allItems.removeWhere((item) => checkedItems.contains(item.id));
      filterData();
      checkedItems.clear();
      Get.snackbar("Thành công", "Đã xoá các mục đã chọn",
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể xoá: $e",
          backgroundColor: Colors.red.withOpacity(0.1), colorText: Colors.red);
    }
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
}
