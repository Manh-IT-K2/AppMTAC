import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mtac/controllers/user/register_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:mtac/widgets/user_widget/input_form_widget.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  //
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKeyRegister,
            child: Column(
              children: [
                SizedBox(height: 20.w),
                Text(
                  "MTAC-Merchant",
                  style: PrimaryFont.headerTextBold().copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 5.w),
                Text(
                  "Please fill in all information to start registration.",
                  style: PrimaryFont.bodyTextBold().copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 5.w),
                // Username
                InputFormWidget(
                  title: 'Username',
                  obscureText: false,
                  controller: controller.usernameController,
                  iconStart: HugeIcons.strokeRoundedUser03,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter username'
                      : null,
                ),

                SizedBox(height: 5.w),

                // Email
                Obx(
                  () => InputFormWidget(
                    title: 'Email',
                    obscureText: false,
                    controller: controller.emailController,
                    iconStart: HugeIcons.strokeRoundedMail01,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!controller.isValidateEmail.value) {
                        return 'Email đã tồn tại hoặc không hợp lệ';
                      }
                      return null;
                    },
                    suffixIcon: controller.isValidateEmail.value ? Icon(HugeIcons.strokeRoundedTick01, color: Colors.green, size: 5.w,) : Icon(HugeIcons.strokeRoundedCancel01, color: Colors.red, size: 5.w),
                    onChanged: (email) {
                      controller.validateEmail(email);
                    },
                  ),
                ),
                SizedBox(height: 5.w),
                // Password
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5.w),

                // Confirm Password
                Obx(
                  () => InputFormWidget(
                    title: 'Confirm Password',
                    controller: controller.confirmPasswordController,
                    obscureText: controller.obscureConfirmPassword.value,
                    iconStart: HugeIcons.strokeRoundedForgotPassword,
                    suffixIcon: IconButton(
                      icon: Icon(controller.obscureConfirmPassword.value
                          ? HugeIcons.strokeRoundedView
                          : HugeIcons.strokeRoundedViewOff),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                    validator: (value) {
                      if (value != controller.passwordController.text) {
                        return 'Confirmation password does not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: PrimaryFont.bodyTextMedium()
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    GestureDetector(
                      onTap: () => Get.offNamed(AppRoutes.login),
                      child: Text(
                        "Login",
                        style: PrimaryFont.bodyTextMedium()
                            .copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.w),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: controller.register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black.withOpacity(0.3),
                    ),
                    child: Text(
                      "Register",
                      style: PrimaryFont.bodyTextMedium().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.w),
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
    );
  }
}
