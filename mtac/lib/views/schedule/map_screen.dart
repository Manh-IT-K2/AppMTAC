import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/bottom_sheet_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final BottomSheetController controller = Get.put(BottomSheetController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = 100.h;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 5.w,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Nội dung màn hình'),
          ),
          // Draggable Bottom Sheet
          Obx(
            () => Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  controller.updateHeight(details.primaryDelta!, screenHeight);
                },
                child: Container(
                  height: screenHeight * controller.sheetHeight.value,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 35.w,
                        height: 1.w,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Text(
                                "Theo dõi điểm đến",
                                style: PrimaryFont.headerTextMedium().copyWith(
                                  color: const Color(0xFF233751),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Container(
                                        width: 3.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                      ),
                                      Container(
                                        width: 0.5.w,
                                        height: 50.w,
                                        color: kPrimaryColor,
                                      ),
                                      Container(
                                        width: 3.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                      ),
                                      Container(
                                        width: 0.5.w,
                                        height: 50.w,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        width: 3.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5.w),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const _ItemDestination(),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: kPrimaryColor,
                                          size: 5.w,
                                        ),
                                        const _ItemDestination(),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: kPrimaryColor,
                                          size: 5.w,
                                        ),
                                        const _ItemDestination(),
                                        SizedBox(
                                          height: 10.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDestination extends StatelessWidget {
  const _ItemDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.w),
        Text(
          "Công ty CP SX TM Sáng Việt",
          style: PrimaryFont.headerTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "+BD: 0",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "+CC: 588.5",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "GOM: L1/11",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "Gom đủ khối lượng không phát sinh",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Chị Giao",
              style: PrimaryFont.bodyTextBold().copyWith(
                color: Colors.black,
              ),
            ),
            Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 4.w,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.edit_square,
              color: const Color(0xFF997FEC),
              size: 5.w,
            ),
            SizedBox(
              width: 2.w,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.HANDOVERRECORD);
              },
              child: Text(
                "Ghi biên bản",
                style: PrimaryFont.bodyTextBold().copyWith(
                  color: const Color(0xFF997FEC),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
