import 'package:get/get.dart';
import 'package:mtac/models/schedule/schedule_collection_model.dart';
import 'package:mtac/services/schedule/schedule_collection_service.dart';

class ScheduleNotyetController extends GetxController {
  
  // function initial
  @override
  void onInit() {
    super.onInit();
    fetchNotYetSchedule();
  }

   // list original
  final allItemsScheduleNotYet = <ScheduleCollectionModel>[].obs;
  
   // Call Api fetchArrangedSchedule
  Future<void> fetchNotYetSchedule() async {
    try {
      final result = await ScheduleCollectionService().fetchNotYetSchedule();
      allItemsScheduleNotYet.assignAll(result);
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể tải dữ liệu: $e');
    }
  }

}