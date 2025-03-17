import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  var sheetHeight = 0.04.obs;

  void updateHeight(double delta, double screenHeight) {
    sheetHeight.value -= delta / screenHeight;
    sheetHeight.value = sheetHeight.value.clamp(0.04, 0.7);
  }
}