import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mtac/common/notify_success_dialog.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class InputController extends GetxController {
  var numbers = <RxString>[].obs; // Danh sách các giá trị nhập
  var status = false.obs;
  var textController = TextEditingController();

  void initializeList(int length) {
    numbers.assignAll(List.generate(length, (index) => "".obs));
  }

  void showInputPopup(int index) {
    textController.text = numbers[index].value;
    Get.dialog(
      Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(top: 10.w),
                width: 90.w,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          status.value = false;
                          Get.back();
                        },
                        child: Container(
                          width: 5.w,
                          height: 5.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(3.w)),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 3.w,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Thêm dữ liệu",
                      style: PrimaryFont.headerTextBold()
                          .copyWith(color: kPrimaryColor),
                    ),
                    SizedBox(height: 10.w),
                    Text(
                      "Khối lượng",
                      style: PrimaryFont.bodyTextMedium()
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 1.w),
                    SizedBox(
                      height: 10.w,
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: "Nhập khối lượng",
                          hintStyle: PrimaryFont.bodyTextMedium()
                              .copyWith(color: Colors.grey),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          suffixIcon: Container(
                            alignment: Alignment.center,
                            width: 40,
                            child: Text(
                              "kg",
                              style: PrimaryFont.bodyTextMedium()
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(height: 1.w),
                    Obx(
                      () => status.value
                          ? Text(
                              "Chưa nhập khối lượng",
                              style: PrimaryFont.bodyTextMedium()
                                  .copyWith(color: Colors.red),
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(height: 10.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (textController.text.isNotEmpty &&
                                !textController.text.contains("Not value")) {
                              numbers[index].value = textController.text;
                              status.value = false;
                              Get.back();
                              NotifySuccessDialog().showNotifyPopup();
                            } else {
                              status.value = true;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              elevation: 5,
                              minimumSize: Size(15.h, 5.h)),
                          child: Text(
                            "Thêm",
                            style: PrimaryFont.bodyTextBold()
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
