import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/user/login_controller.dart';
import 'package:mtac/services/user/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


@override
void initState() {
  initState();
  final loginService = LoginService();
  loginService.checkServerStatus().then((isOnline){
    if (isOnline) {
      print("Server OK");
    } else {
      print("Server không hoạt động");
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
                Text("Login Screen", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

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

                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: controller.login,
                        child: const Text("Đăng nhập"),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
