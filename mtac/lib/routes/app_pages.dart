import 'package:get/get.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/views/schedule/detail_schedule_collection_admin_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_arranged_admin_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_today_admin_screen.dart';
import 'package:mtac/views/main_screen.dart';
import 'package:mtac/views/schedule/schedule_collection_admin_screen.dart';
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
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.scheduleCollection,
      page: () => const ScheduleCollectionAdminScreen(),
    ),
    GetPage(
      name: AppRoutes.scheduleCollectionToday,
      page: () => const ScheduleCollectionTodayAdminScreen(),
    ),
    GetPage(
      name: AppRoutes.detailScheduleCollection,
      page: () => const DetailScheduleCollectionAdminScreen(),
    ),
    GetPage(
      name: AppRoutes.scheduleCollectionArranged,
      page: () => const ScheduleCollectionArrangedAdminScreen(),
    ),
  ];
}
