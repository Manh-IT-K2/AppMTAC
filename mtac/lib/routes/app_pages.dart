import 'package:get/get.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/views/main_screen.dart';
import 'package:mtac/views/schedule/handover_record_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_screen.dart';
import 'package:mtac/views/schedule/schedule_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULECOLLECTION,
      page: () => const ScheduleCollectionScreen(),
    ),
    GetPage(
      name: AppRoutes.HANDOVERRECORD,
      page: () => HandoverRecordScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULE, 
      page: () => ScheduleScreen(),
      ),
  ];
}
