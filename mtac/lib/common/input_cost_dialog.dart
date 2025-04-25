import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/schedule/schedule_today_controller.dart';
import 'package:mtac/models/schedule/cost_model.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';

class InputCostDialog {
  void showCostDialog(BuildContext context, int idScheduleToday) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController costController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController totalMoneyController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
    final TextEditingController statusController = TextEditingController();

  final ScheduleController controller = Get.find();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Thêm Chi Phí",
            style: PrimaryFont.titleTextBold(),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Category Input
                  InputFormCost(
                    label: "Hạng mục",
                    controller: categoryController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập hạng mục';
                      }
                      return null;
                    },
                  ),
                  // Cost Input
                  InputFormCost(
                    label: "Đơn Giá",
                    controller: costController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập đơn giá';
                      }
                      return null;
                    },
                  ),
                  // Quantity Input
                  InputFormCost(
                    label: "Số lượng",
                    controller: quantityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập số lượng';
                      }
                      return null;
                    },
                  ),

                  // Total Money Input
                  InputFormCost(
                    label: "Thành tiền",
                    controller: totalMoneyController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thành tiền';
                      }
                      return null;
                    },
                  ),

                  // Note Input
                  InputFormCost(
                    label: "Ghi chú",
                    controller: noteController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập ghi chú';
                      }
                      return null;
                    },
                  ),

                  // Status Input
                  InputFormCost(
                    label: "Trạng thái",
                    controller: statusController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập trạng thái';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Hủy",
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Submit the form data
                  final costModel = CostModel(                   
                    scheduleCollectionId: idScheduleToday,
                    category: categoryController.text,
                    cost: costController.text,
                    quantity: quantityController.text,
                    totalMoney: totalMoneyController.text,
                    note: noteController.text,
                    status: statusController.text,
                  );
                  controller.addCostScheduleCollection(costModel);
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                "Lưu",
                style: PrimaryFont.bodyTextBold().copyWith(color: kPrimaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

class InputFormCost extends StatelessWidget {
  const InputFormCost({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1.0,
          ),
        ),
        labelStyle: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
        floatingLabelStyle:PrimaryFont.bodyTextMedium().copyWith(color: kPrimaryColor),
      ),
      cursorColor: kPrimaryColor.withOpacity(0.5),
      validator: validator,
    );
  }
}
