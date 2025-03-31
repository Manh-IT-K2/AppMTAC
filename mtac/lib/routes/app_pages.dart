import 'package:get/get.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/views/schedule/detail_schedule_collection_admin_screen.dart';
import 'package:mtac/views/driver/driver_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_arranged_admin_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_today_admin_screen.dart';
import 'package:mtac/views/main_screen.dart';
import 'package:mtac/views/driver/handover_record_driver_screen.dart';
import 'package:mtac/views/driver/map_driver_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_admin_screen.dart';
import 'package:mtac/views/driver/schedule_colection_driver_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.MAIN,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: AppRoutes.HANDOVERRECORDDRIVER,
      page: () => HandoverRecordDriverScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULEDRIVER,
      page: () => ScheduleColectionDriverScreen(),
    ),
    GetPage(
      name: AppRoutes.MAPDRIVER,
      page: () => MapDriverScreen(),
    ),
    GetPage(
      name: AppRoutes.DRIVER,
      page: () => DriverScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULECOLLECTIONADMIN,
      page: () => const ScheduleCollectionAdminScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULECOLLECTIONTODAYADMIN,
      page: () => const ScheduleCollectionTodayAdminScreen(),
    ),
    GetPage(
      name: AppRoutes.DETAILSCHEDULECOLLECTIONADMIN,
      page: () => const DetailScheduleCollectionAdminScreen(),
    ),
    GetPage(
      name: AppRoutes.SCHEDULECOLLECTIONARRANGEDADMIN,
      page: () => const ScheduleCollectionArrangedAdminScreen(),
    ),
  ];
}
