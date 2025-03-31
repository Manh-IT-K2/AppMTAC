import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mtac/controllers/driver_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class ScheduleCollectionArrangedScreen extends StatefulWidget {
  const ScheduleCollectionArrangedScreen({super.key});

  @override
  State<ScheduleCollectionArrangedScreen> createState() =>
      _ScheduleCollectionArrangedScreenState();
}

class _ScheduleCollectionArrangedScreenState
    extends State<ScheduleCollectionArrangedScreen> {
  //
  final DriverController controller = Get.put(DriverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              size: 5.w,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(bottom: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                  text: "SP764\n",
                  style:
                      PrimaryFont.bodyTextMedium().copyWith(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "Quan Văn Mạnh",
                      style: PrimaryFont.titleTextMedium()
                          .copyWith(color: Colors.black),
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.w),
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                "*Lịch Gom Đã Xếp*",
                style: PrimaryFont.headerTextBold(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.w),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 5.h,
              color: const Color(0xFFEBF5FF),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.itemScheduleCollectionDriver
                    .map(
                      (title) => _ItemListCollection(title: title),
                    )
                    .toList(),
              ),
            ),
            Row(
              children: [
                Obx(
                  () => controller.checkedItems.isNotEmpty
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () => controller.toggleSelectAll(
                                controller.filteredItems
                                    .map((e) => e.collectionId)
                                    .toList(),
                              ),
                              child: Container(
                                width: 5.w,
                                height: 5.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(1.w),
                                  color: controller.isAllSelected(
                                    controller.filteredItems
                                        .map((e) => e.collectionId)
                                        .toList(),
                                  )
                                      ? Colors.red
                                      : Colors.white,
                                ),
                                child: controller.isAllSelected(
                                  controller.filteredItems
                                      .map((e) => e.collectionId)
                                      .toList(),
                                )
                                    ? Icon(Icons.check,
                                        color: Colors.white, size: 3.w)
                                    : null,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text("Chọn tất cả",
                                style: PrimaryFont.bodyTextMedium()),
                          ],
                        )
                      : const SizedBox(),
                ),
                const Spacer(),
                Obx(
                  () => controller.checkedItems.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            controller.deleteSelectedItems();
                          },
                          child: Row(
                            children: [
                              Icon(HugeIcons.strokeRoundedDelete01,
                                  color: Colors.red, size: 5.w),
                              SizedBox(width: 1.w),
                              Text(
                                "Xoá",
                                style: PrimaryFont.bodyTextMedium(),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
                SizedBox(width: 3.w),
                PopupMenuButton<String>(
                  color: Colors.white,
                  onSelected: (String value) {
                    controller.updateFilter(value);
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: "Khoáng", child: Text("Khoáng")),
                    const PopupMenuItem(value: "Cân ký", child: Text("Cân ký")),
                  ],
                  child: Row(
                    children: [
                      Icon(HugeIcons.strokeRoundedFilter,
                          color: Colors.black, size: 5.w),
                      SizedBox(width: 1.w),
                      Text(
                        "Lọc",
                        style: PrimaryFont.bodyTextMedium(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  width: 35.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryColor.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "March, 2025",
                        style: PrimaryFont.bodyTextMedium(),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        size: 4.w,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 4.w,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.w,
            ),
            Expanded(
              child: PageView(
                controller: controller.pageControllerDriver,
                onPageChanged: controller.onPageChangedScheduleDriver,
                children: controller.itemScheduleCollectionDriver.map(
                  (title) {
                    return Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        itemCount: controller.filteredItems.length,
                        itemBuilder: (context, index) {
                          final data = controller.filteredItems[index];
                          return _ItemMainScheduleCollection(
                            controller: controller,
                            collectionId: data.collectionId,
                            nameBusiness: data.nameBusiness,
                            areaTransit: data.areaTransit,
                            typeWaste: data.typeWaste,
                            contactPerson: data.contactPerson,
                            timeCollection: data.timeCollection,
                            status: data.status,
                            onTap: () {
                              // Get.toNamed(
                              //   AppRoutes.DETAILSCHEDULECOLLECTIONDRIVER,
                              //   arguments: {
                              //     "costTransit": data.costTransit,
                              //     "nameBusiness": data.nameBusiness,
                              //     "areaTransit": data.areaTransit,
                              //     "typeWaste": data.typeWaste,
                              //     "contactPerson": data.contactPerson,
                              //     "timeCollection": data.timeCollection,
                              //     "numberPlate": data.numberPlate,
                              //     "addressCollection": data.addressCollection,
                              //     "debtStatus": data.debtStatus,
                              //     "dayCollection": data.dayCollection,
                              //     "daySendCollection": data.daySendCollection,
                              //     "image": data.image,
                              //   },
                              // );
                            },
                          );
                        },
                      );
                    });
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemMainScheduleCollection extends StatelessWidget {
  const _ItemMainScheduleCollection({
    required this.controller,
    required this.collectionId,
    required this.nameBusiness,
    required this.areaTransit,
    required this.typeWaste,
    required this.contactPerson,
    required this.timeCollection,
    required this.status,
    this.onTap,
  });

  final bool status;
  final String collectionId,
      nameBusiness,
      areaTransit,
      typeWaste,
      contactPerson,
      timeCollection;
  final DriverController controller;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          if (kDebugMode) {
            print("onTap function is called!");
          }
          onTap!();
        } else {
          if (kDebugMode) {
            print("onTap is null!");
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(12.0),
        width: 100.w,
        height: 50.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      status ? "Khoáng" : "Cân ký",
                      style: PrimaryFont.bodyTextBold().copyWith(
                          color: status ? Colors.orange : Colors.green),
                    ),
                    Icon(
                      HugeIcons.strokeRoundedDeliveryTruck02,
                      color: status ? Colors.orange : Colors.green,
                      size: 10.w,
                    ),
                  ],
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  collectionId,
                  style: PrimaryFont.titleTextBold(),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => controller.toggleCheck(collectionId),
                  child: Obx(
                    () => Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(1.w),
                        color: controller.isChecked(collectionId)
                            ? Colors.red
                            : Colors.white,
                      ),
                      child: controller.isChecked(collectionId)
                          ? Icon(Icons.check, color: Colors.white, size: 3.w)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            _ItemInfoScheduleCollection(
              title: "Tên công ty:",
              subTitle: nameBusiness,
            ),
            _ItemInfoScheduleCollection(
              title: "Khu vực vận chuyển:",
              subTitle: areaTransit,
            ),
            _ItemInfoScheduleCollection(
              title: "Loại hàng:",
              subTitle: typeWaste,
            ),
            _ItemInfoScheduleCollection(
              title: "Tài xế phụ trách: ",
              subTitle: contactPerson,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: timeCollection.contains("Chưa thu gom")
                  ? Container(
                      width: 35.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          timeCollection,
                          style: PrimaryFont.titleTextBold()
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      width: 35.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Đã thu gom",
                          style: PrimaryFont.titleTextBold()
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemInfoScheduleCollection extends StatelessWidget {
  const _ItemInfoScheduleCollection({
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.grey),
        children: [
          TextSpan(
            text: subTitle,
            style: PrimaryFont.bodyTextBold().copyWith(color: Colors.black),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ItemListCollection extends StatelessWidget {
  final String title;
  final DriverController controller = Get.find<DriverController>();

  _ItemListCollection({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectItemScheduleDriver(title);
        controller.updateFilter(title);
      },
      child: Obx(
        () {
          bool isSelected = controller.selectedTitleDriver.value == title;
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
        },
      ),
    );
  }
}
