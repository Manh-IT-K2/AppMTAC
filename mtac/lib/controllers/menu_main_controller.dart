import 'package:get/get.dart';

class MenuMainController extends GetxController {
  final selectedIndex = 0.obs;

  // Stack để lưu lịch sử index
  final List<int> indexHistory = [0];

  void setIndex(int index) {
    selectedIndex.value = index;
    indexHistory.add(index); // lưu vào lịch sử
  }

  // Gọi khi back lại
  void backIndex() {
    if (indexHistory.length > 1) {
      indexHistory.removeLast(); // bỏ index hiện tại
      selectedIndex.value = indexHistory.last; // lấy index trước đó
    }
  }
}
