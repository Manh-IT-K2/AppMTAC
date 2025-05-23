import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mtac/configs/api_config.dart';
import 'package:mtac/controllers/user/login_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:mtac/widgets/user_widget/input_form_widget.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

@override
void initState() {
  initState();
  final apiConfig = ApiConfig();
  apiConfig.checkServerStatus().then((isOnline) {
    if (isOnline) {
      if (kDebugMode) {
        print("Server OK");
      }
    } else {
      if (kDebugMode) {
        print("Server không hoạt động");
      }
    }
  });
}

//
final controller = Get.put(LoginController(), permanent: true);

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKeyLogin,
              child: Column(
                children: [
                  SizedBox(height: 20.w),
                  Text(
                    "Welcom to",
                    style: PrimaryFont.bold(10.w).copyWith(
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    "MTAC-Merchant",
                    style: PrimaryFont.titleTextBold().copyWith(
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 5.w),
                  InputFormWidget(
                    title: 'Email',
                    obscureText: false,
                    controller: controller.emailController,
                    iconStart: HugeIcons.strokeRoundedMail01,
                    suffixIcon: IconButton(
                      icon: const Icon(HugeIcons.strokeRoundedCancel01),
                      iconSize: 5.w,
                      onPressed: controller.clearTextEmail,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      if (!value.contains('@')) return 'Email không hợp lệ';
                      return null;
                    },
                  ),
                  SizedBox(height: 5.w),
                  Obx(
                    () => InputFormWidget(
                      title: 'Password',
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      iconStart: HugeIcons.strokeRoundedLockPassword,
                      suffixIcon: IconButton(
                        icon: Icon(controller.obscurePassword.value
                            ? HugeIcons.strokeRoundedView
                            : HugeIcons.strokeRoundedViewOff),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Vui lòng nhập password'
                          : null,
                    ),
                  ),
                  SizedBox(height: 5.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot password?",
                          style: PrimaryFont.bodyTextMedium()
                              .copyWith(color: kPrimaryColor),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.register);
                        },
                        child: Text(
                          "Register",
                          style: PrimaryFont.bodyTextMedium()
                              .copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.w),
                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: 100.w,
                            child: ElevatedButton(
                              onPressed: controller.login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.w),
                                ),
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.3),
                              ),
                              child: Text(
                                "Sign in",
                                style: PrimaryFont.bodyTextMedium().copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    "----- Or log in with -----",
                    style: PrimaryFont.bodyTextMedium()
                        .copyWith(color: kPrimaryColor),
                  ),
                  SizedBox(height: 15.w),
                  Image.asset(
                    "assets/images/icon_google.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By logging in, you accept",
                        style: PrimaryFont.bodyTextMedium()
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 1.w),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "terms of use",
                          style: PrimaryFont.bodyTextMedium()
                              .copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
