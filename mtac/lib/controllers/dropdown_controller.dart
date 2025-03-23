import 'package:get/get.dart';

class DropdownController extends GetxController {

  // initial variable
  var selectedValue = "Null".obs;
  final List<String> items = [
    "Null",
    "Chưa thu gom",
    "Đang thu gom",
    "Đã thu gom"
  ];

  DropdownController(String initialStatus) {
    selectedValue.value = initialStatus;
  }
}
