import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mtac/models/schedule_collection_model.dart';
import 'package:mtac/services/schedule/schedule_collection_service.dart';

class ScheduleArrangedController extends GetxController {
  /* schedule collection arranged */
  // function initial
  @override
  void onInit() {
    super.onInit();
    fetchArrangedSchedule();
  }

  // depose
  @override
  void onClose() {
    pageControllerScheduleArranged.dispose();
    super.onClose();
  }

  // list original
  final allItemsScheduleArranged = <ScheduleCollectionModel>[].obs;
  // initial variable schedule collection today
  var isLoadingScheduleArranged = false.obs;
  // status filter current
  var selectedFilterScheduleArranged = "null".obs;
  // list filtered
  var filteredItemsScheduleArranged = <ScheduleCollectionModel>[].obs;
  var checkedItemsScheduleArranged = <int>[].obs;
  var pageControllerScheduleArranged = PageController();
  var selectedTitleScheduleArranged = "Tất cả".obs;
  final List<String> itemScheduleCollectionArranged = [
    "Tất cả",
    "Đã gom",
    "Chưa gom"
  ];

  // function chose item schedule arranged
  void selectItemScheduleArranged(String title) {
    int index = itemScheduleCollectionArranged.indexOf(title);
    if (index != -1) {
      selectedTitleScheduleArranged.value = title;
      if (pageControllerScheduleArranged.hasClients) {
        pageControllerScheduleArranged.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Call Api fetchArrangedSchedule
  Future<void> fetchArrangedSchedule() async {
    try {
      final result = await ScheduleCollectionService().fetchArrangedSchedule();
      allItemsScheduleArranged.assignAll(result);
      filterDataScheduleArranged();
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể tải dữ liệu: $e');
    }
  }

  // Call API delete from collectionId
  void deleteSelectedItemsScheduleArranged() async {
    if (checkedItemsScheduleArranged.isEmpty) {
      Get.snackbar("Thông báo", "Chưa chọn mục nào để xoá");
      return;
    }
    try {
      for (int id in checkedItemsScheduleArranged) {
        await ScheduleCollectionService().deleteScheduleCollection(id);
      }
      allItemsScheduleArranged.removeWhere(
          (item) => checkedItemsScheduleArranged.contains(item.id));
      filterDataScheduleArranged();
      checkedItemsScheduleArranged.clear();
      Get.snackbar("Thành công", "Đã xoá các mục đã chọn");
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể xoá: $e");
    }
  }

  // Update status on swipe schedule arranged
  void onPageChangedScheduleArranged(int index) {
    if (index >= 0 && index < itemScheduleCollectionArranged.length) {
      selectedTitleScheduleArranged.value =
          itemScheduleCollectionArranged[index];
    }
  }

  // tranfer chose
  void toggleCheckScheduleArranged(int collectionId) {
    if (checkedItemsScheduleArranged.contains(collectionId)) {
      checkedItemsScheduleArranged.remove(collectionId);
    } else {
      checkedItemsScheduleArranged.add(collectionId);
    }
  }

  // check chose
  bool isCheckedScheduleArranged(int collectionId) {
    return checkedItemsScheduleArranged.contains(collectionId);
  }

  // chose all
  void toggleSelectAllScheduleArranged(List<int> allCollectionIds) {
    if (checkedItemsScheduleArranged.length == allCollectionIds.length) {
      checkedItemsScheduleArranged.clear();
    } else {
      checkedItemsScheduleArranged.assignAll(allCollectionIds);
    }
  }

  // check chose all
  bool isAllSelectedScheduleArranged(List<String> allCollectionIds) {
    return checkedItemsScheduleArranged.length == allCollectionIds.length;
  }

  // function filter by status
  void filterDataScheduleArranged() async {
    // start
    isLoadingScheduleArranged.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    List<ScheduleCollectionModel> tempList =
        List.from(allItemsScheduleArranged);

    // filter by status "Đã gom" or "Chưa gom"
    if (selectedTitleScheduleArranged.value == "Đã gom") {
      tempList = tempList
          .where((item) => !item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedTitleScheduleArranged.value == "Chưa gom") {
      tempList = tempList
          .where((item) => item.timeCollection.contains("Chưa thu gom"))
          .toList();
    }

    // filter by status "Khoáng" hoặc "Cân ký" of Today
    if (selectedFilterScheduleArranged.value == "Khoáng") {
      tempList = tempList.where((item) => item.status == true).toList();
    } else if (selectedFilterScheduleArranged.value == "Cân ký") {
      tempList = tempList.where((item) => item.status == false).toList();
    }

    // filter by status "Khoáng" hoặc "Cân ký" of "Đã gom" or "Chưa gom"
    if (selectedFilterScheduleArranged.value == "Khoáng" &&
        selectedTitleScheduleArranged.value == "Đã gom") {
      tempList = tempList
          .where((item) =>
              item.status == true &&
              !item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedFilterScheduleArranged.value == "Cân ký" &&
        selectedTitleScheduleArranged.value == "Đã gom") {
      tempList = tempList
          .where((item) =>
              item.status == false &&
              !item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedFilterScheduleArranged.value == "Cân ký" &&
        selectedTitleScheduleArranged.value == "Chưa gom") {
      tempList = tempList
          .where((item) =>
              item.status == false &&
              item.timeCollection.contains("Chưa thu gom"))
          .toList();
    } else if (selectedFilterScheduleArranged.value == "Khoáng" &&
        selectedTitleScheduleArranged.value == "Chưa gom") {
      tempList = tempList
          .where((item) =>
              item.status == true &&
              item.timeCollection.contains("Chưa thu gom"))
          .toList();
    }

    // update list filtered
    filteredItemsScheduleArranged.value = tempList;
    // end
    isLoadingScheduleArranged.value = false;
  }

  // update filter
  void updateFilterScheduleArranged(String filter) {
    selectedFilterScheduleArranged.value = filter;
    filterDataScheduleArranged();
  }
}
