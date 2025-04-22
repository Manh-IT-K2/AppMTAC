import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/configs/api_config.dart';
import 'package:mtac/controllers/user/login_controller.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';

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

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Welcom to",
                  style: PrimaryFont.headerTextBold().copyWith(
                    color: kPrimaryColor.withOpacity(0.7),
                  ),
                ),
                Text(
                  "MTAC-Merchant",
                  style: PrimaryFont.headerTextBold().copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(controller.obscurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    )),
                const SizedBox(height: 24),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: controller.login,
                          child: const Text("Đăng nhập"),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
