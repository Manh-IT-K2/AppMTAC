import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/common/responsive_builder.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/controllers/dropdown_controllser.dart';
import 'package:mtac/controllers/image_picker_controller.dart';
import 'package:mtac/data/schedule_screen/item_info_waste.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:mtac/widgets/bottom_image_source_sheet.dart';

class HandoverRecordScreen extends StatelessWidget {
  HandoverRecordScreen({super.key});

  //
  final List<DropdownController> wasteControllers =
      List.generate(infoWasteData.length, (_) => DropdownController());
  //
  final ImagePickerController imageController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    //
    final size = context.screenSize;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          txtTitleHR,
          style: PrimaryFont.bold(24).copyWith(color: const Color(0xFF0A4564)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: ResponsiveBuilder(
            portrait: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderHandoverRecordScreen(),
                _BodyHandoverRecordScreen(
                wasteControllers: wasteControllers, 
                sHeightBody: size.height * 0.28,
                sHeightItem: size.height * 0.04,
                sWidthSizeBox: size.width *0.025, 
                sWidthNameWaste: size.width * 0.25, 
                sWidthCodeWaste: size.width * 0.19, 
                sWidthStatusWaste: size.width * 0.2, 
                sWidthNumberWaste: size.width * 0.18),
                const SizedBox(
                  height: 25,
                ),
                _BottomHandoverRecordSceen(
                  imageController: imageController,
                  sWidthCon: size.width * 0.28,
                  sHeightCon: size.height * 0.18),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            landscape: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderHandoverRecordScreen(),
               _BodyHandoverRecordScreen(
                wasteControllers: wasteControllers, 
                sHeightBody: size.height * 0.28,
                sHeightItem: size.height * 0.1, 
                sWidthSizeBox: size.width *0.07, 
                sWidthNameWaste: size.width * 0.26, 
                sWidthCodeWaste: size.width * 0.22, 
                sWidthStatusWaste: size.width * 0.23, 
                sWidthNumberWaste: size.width * 0.14),
                const SizedBox(
                  height: 25,
                ),
                _BottomHandoverRecordSceen(
                  imageController: imageController,
                  sWidthCon: size.width * 0.3,
                  sHeightCon: size.height * 0.35),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomHandoverRecordSceen extends StatelessWidget {
  const _BottomHandoverRecordSceen({
    super.key,
    required this.imageController, required this.sWidthCon, required this.sHeightCon,
  });

  final ImagePickerController imageController;
  final double sWidthCon, sHeightCon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• $txtTotalStatuWasteHR R(rắn); L(lỏng)",
          style: PrimaryFont.light(14).copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          txtImageHR,
          style: PrimaryFont.bold(14).copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) => const BottomImageSourceSheet(),
                  );
                },
                child: Container(
                  width: sWidthCon,
                  height: sHeightCon,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "+",
                    style: PrimaryFont.thin(100).copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Obx(() => imageController.checkDistance.value
                  ? const SizedBox(width: 50)
                  : const SizedBox()),
              Obx(() {
                if (imageController.selectedImages.isEmpty) {
                  return const SizedBox();
                }
                return Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: imageController.selectedImages
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    File imageFile = entry.value;
                    double rotationAngle = (index - 2) * 0.08;

                    return Transform.rotate(
                      angle: rotationAngle,
                      child: Container(
                        width: sWidthCon,
                        height: sHeightCon,
                        margin: EdgeInsets.only(left: index * 0.1),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: FileImage(imageFile),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              })
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                minimumSize: const Size(300, 50)),
            child: Text(
              txtButSendHR,
              style: PrimaryFont.bold(16).copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _BodyHandoverRecordScreen extends StatelessWidget {
  const _BodyHandoverRecordScreen({
    super.key,
    required this.wasteControllers, required this.sHeightItem, required this.sWidthNameWaste, required this.sWidthCodeWaste, required this.sWidthStatusWaste, required this.sWidthNumberWaste, required this.sHeightBody, required this.sWidthSizeBox,
  });

  final List<DropdownController> wasteControllers;
  final double sHeightBody, sHeightItem, sWidthNameWaste, sWidthCodeWaste, sWidthStatusWaste, sWidthNumberWaste, sWidthSizeBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              txtNameWasteHR,
              style: PrimaryFont.bold(14).copyWith(color: Colors.black),
            ),
            Text(
              txtCodeWasteHR,
              style: PrimaryFont.bold(14).copyWith(color: Colors.black),
            ),
            Text(
              txtStatusWasteHR,
              style: PrimaryFont.bold(14).copyWith(color: Colors.black),
            ),
            Text(
              txtNumberWasteHR,
              style: PrimaryFont.bold(14).copyWith(color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: sHeightBody,
          child: ListView.builder(
              itemCount: infoWasteData.length,
              itemBuilder: (context, index) {
                final item = infoWasteData[index];
                return Container(
                  height: sHeightItem,
                  margin: const EdgeInsets.only(
                    top: 12,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: sWidthSizeBox,
                      ),
                      SizedBox(
                        width: sWidthNameWaste,
                        child: Text(
                          item["sName"]!,
                          style: PrimaryFont.light(14)
                              .copyWith(color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: sWidthCodeWaste,
                        child: Text(
                          item["sCode"]!,
                          style: PrimaryFont.light(14)
                              .copyWith(color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: sWidthStatusWaste,
                        child: Obx(
                          () => DropdownButton<String>(
                            isExpanded: true,
                            value: wasteControllers[index].selectedValue.value,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: PrimaryFont.bold(14).copyWith(
                              color: Colors.green,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onChanged: (String? newValue) {
                              wasteControllers[index].selectedValue.value =
                                  newValue!;
                            },
                            items: wasteControllers[index]
                                .items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: sWidthNumberWaste,
                        child: Text(
                          item["sNumber"]!,
                          style: PrimaryFont.light(14)
                              .copyWith(color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class _HeaderHandoverRecordScreen extends StatelessWidget {
  const _HeaderHandoverRecordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "$txtCodeHR 003437",
            style: PrimaryFont.light(14).copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            txtNoteHR,
            style: PrimaryFont.light(14).copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "$txtTimeHR 9 giờ 30, ngày 21/02/2025",
            style: PrimaryFont.light(14).copyWith(color: kPrimaryColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: txtAddress1HR,
                  style: PrimaryFont.light(14).copyWith(color: Colors.black),
                ),
                TextSpan(
                  text:
                      " Dự Án Nhà máy sử dụng nước Thải Nhiên liệu Thị Nghè TP.HCM giai đoạn 2.",
                  style: PrimaryFont.bold(14).copyWith(color: Colors.black),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 20),
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: txtAddress2HR,
                  style: PrimaryFont.light(14).copyWith(color: Colors.black),
                ),
                TextSpan(
                  text:
                      " Công ty CP Xây Dựng Đê Kè và phát triển Nông Thôn Hải Dương.",
                  style: PrimaryFont.bold(14).copyWith(color: Colors.black),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ItemInfoWaste extends StatelessWidget {
  const _ItemInfoWaste({
    required this.controller,
    required this.sName,
    required this.sCode,
    required this.sNumber,
  });

  final DropdownController controller;
  final String sName, sCode, sNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(
        top: 12,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          SizedBox(
            width: 95,
            child: Text(
              sName,
              style: PrimaryFont.light(14).copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            width: 72,
            child: Text(
              sCode,
              style: PrimaryFont.light(14).copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          SizedBox(
            width: 80,
            child: Obx(
              () => DropdownButton<String>(
                isExpanded: true,
                value: controller.selectedValue.value,
                icon: const Icon(Icons.keyboard_arrow_down),
                style: PrimaryFont.bold(14).copyWith(
                  color: Colors.green,
                  overflow: TextOverflow.ellipsis,
                ),
                onChanged: (String? newValue) {
                  controller.selectedValue.value = newValue!;
                },
                items: controller.items
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          SizedBox(
            width: 60,
            child: Text(
              sNumber,
              style: PrimaryFont.light(14).copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
