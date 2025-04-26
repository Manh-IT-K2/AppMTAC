// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/connection/connection_controller.dart';
import 'package:mtac/routes/app_pages.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/views/connection/connection_middleware_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  // only portrait
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectionController());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    // runApp(DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Get.config(enableLog: false);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,

          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          initialRoute: AppRoutes.splashScreen,
          getPages: AppPages.routes,
          routingCallback: (routing) {
            final redirectSettings =
                ConnectionMiddlewareScreen().redirect(routing?.current);
            if (redirectSettings != null) {
              Get.offAllNamed(redirectSettings.name!);
            }
          },
        );
      },
    );
  }
}
