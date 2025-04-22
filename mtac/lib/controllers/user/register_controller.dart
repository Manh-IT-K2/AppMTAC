import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/services/user/register_service.dart';

class RegisterController extends GetxController {

  // initial variable
  final formKeyRegister = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  final isLoading = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  // Call register from RegisterService
  Future<void> register() async {
    if (!formKeyRegister.currentState!.validate()) return;

    isLoading.value = true;

    final success = await RegisterService().register(
      name: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    isLoading.value = false;

    if (success) {
      Get.snackbar("Thành công", "Đăng ký thành công!",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.green);
      Get.toNamed(AppRoutes.login);
    } else {
      Get.snackbar("Lỗi", "Đăng ký thất bại. Vui lòng kiểm tra lại.",
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
