import 'package:get/get.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/views/driver/detail_schedule_collection_driver_screen.dart';
import 'package:mtac/views/driver/driver_screen.dart';
import 'package:mtac/views/driver/schedule_collection_driver_screen.dart';
import 'package:mtac/views/main_screen.dart';
import 'package:mtac/views/schedule/handover_record_screen.dart';
import 'package:mtac/views/schedule/map_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_screen.dart';
import 'package:mtac/views/schedule/schedule_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.MAIN,
      page: () => const MainScreen(),
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
    GetPage(
      name: AppRoutes.MAP,
      page: () => MapScreen(),
    ),
    GetPage(
      name: AppRoutes.DRIVER,
      page: () => DriverScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULECOLLECTIONDRIVER,
      page: () => const ScheduleCollectionDriverScreen(),
    ),
    GetPage(
      name: AppRoutes.DETAILSCHEDULECOLLECTIONDRIVER,
      page: () => const DetailScheduleCollectionDriverScreen(),
    ),
  ];
}
