import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/trip_controller.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  final TripController controller = Get.put(TripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 5.w,
              ),
            ),
            Text(
              "Danh sách chuyến",
              style: PrimaryFont.headerTextBold().copyWith(color: Colors.black),
            ),
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ]),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 5.w,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 20, right: 12),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Xin chào,",
                    style: PrimaryFont.bodyTextMedium()
                        .copyWith(color: Colors.grey),
                  ),
                  TextSpan(
                    text: " Quan Văn Mạnh",
                    style: PrimaryFont.bodyTextBold()
                        .copyWith(color: Colors.black),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lịch thu gom hôm nay: ",
                    style: PrimaryFont.headerTextBold()
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    "20 - 02 - 2025",
                    style: PrimaryFont.bodyTextBold()
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 5.h,
              color: const Color(0xFFEBF5FF),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.items
                      .map((title) => _ItemListTrip(title: title))
                      .toList()),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: controller.items.map((title) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => const _ItemTripWork(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemTripWork extends StatelessWidget {
  const _ItemTripWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C7E4),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: Center(
                    child: Text(
                      "Khoán",
                      style: PrimaryFont.bodyTextBold()
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  "Chất thải nguy hại",
                  style:
                      PrimaryFont.bodyTextBold().copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  "1 CN, Môi Trường Đô Thị",
                  style:
                      PrimaryFont.bodyTextBold().copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.w,
                ),
                Text(
                  "20 -02 - 2025",
                  style:
                      PrimaryFont.bodyTextBold().copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 8.h,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.w),
                  bottomRight: Radius.circular(5.w),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(1, 4))
                ]),
            child: Center(
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  "Chưa thu gom",
                  style:
                      PrimaryFont.bodyTextBold().copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemListTrip extends StatelessWidget {
  final String title;
  final TripController controller = Get.find<TripController>();

  _ItemListTrip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectItem(title),
      child: Obx(() {
        bool isSelected = controller.selectedTitle.value == title;
        return IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
              Container(
                color: isSelected ? Colors.blue : Colors.transparent,
                height: 2,
                width: isSelected ? double.infinity : 0,
                margin: const EdgeInsets.only(top: 5),
              ),
            ],
          ),
        );
      }),
    );
  }
}
