import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/services/user/login_service.dart';


class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    isLoading.value = true;

    final success = await LoginService().login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    isLoading.value = false;

    if (success) {
      Get.offAllNamed('/main');
    } else {
      Get.snackbar("Lỗi", "Đăng nhập thất bại. Kiểm tra lại thông tin.",
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
