import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/connection/connection_controller.dart';
import 'package:mtac/routes/app_routes.dart';

class ConnectionMiddlewareScreen extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final connectionController = Get.find<ConnectionController>();

    if (!connectionController.hasConnection.value && route != AppRoutes.noConnection) {
      // Nếu mất mạng và chưa ở màn NoConnection
      return const RouteSettings(name: AppRoutes.noConnection);
    }

    if (connectionController.hasConnection.value && route == AppRoutes.noConnection) {
      // Nếu có mạng lại và đang ở màn NoConnection
      return const RouteSettings(name: AppRoutes.splashScreen);
    }

    return null; // Bình thường, đi tiếp
  }
}
