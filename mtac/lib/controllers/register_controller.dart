import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/services/user/register_service.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

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

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

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
          snackPosition: SnackPosition.BOTTOM);
      //Get.offAllNamed('/home'); // Thay đổi theo route màn hình chính của bạn
    } else {
      Get.snackbar("Lỗi", "Đăng ký thất bại. Vui lòng kiểm tra lại.",
          snackPosition: SnackPosition.BOTTOM);
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
