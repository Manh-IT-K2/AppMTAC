import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = "Null".obs;
  final List<String> items = [
    "Null",
    "Chưa xử lý",
    "Đang xử lý",
    "Đã xử lý"
  ];

  DropdownController(String initialStatus) {
    selectedValue.value = initialStatus;
  }
}
