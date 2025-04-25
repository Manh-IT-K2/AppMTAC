import 'package:get/get.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/views/schedule/detail_schedule_collection_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_arranged_admin_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_today_screen.dart';
import 'package:mtac/views/main_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_not_yet_screen.dart';
import 'package:mtac/views/splash_screen.dart';
import 'package:mtac/views/user/login_screen.dart';
import 'package:mtac/views/user/register_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.scheduleCollectionNotYet,
      page: () => const ScheduleCollectionNotYetScreen(),
    ),
    GetPage(
      name: AppRoutes.scheduleCollectionToday,
      page: () => const ScheduleCollectionTodayScreen(),
    ),
    GetPage(
      name: AppRoutes.detailScheduleCollection,
      page: () => DetailScheduleCollectionScreen(),
    ),
    GetPage(
      name: AppRoutes.scheduleCollectionArranged,
      page: () => const ScheduleCollectionArrangedScreen(),
    ),
  ];
}
