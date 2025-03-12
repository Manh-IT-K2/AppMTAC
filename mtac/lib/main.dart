import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mtac/routes/app_pages.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

void main() {

  // only portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
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
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            initialRoute: AppRoutes.MAIN,
            getPages: AppPages.routes);
      },
    );
  }
}
