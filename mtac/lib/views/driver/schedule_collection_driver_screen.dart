import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mtac/controllers/driver_controller.dart';
import 'package:mtac/data/driver_screen/item_schedule_collection_today.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class ScheduleCollectionDriverScreen extends StatefulWidget {
  ScheduleCollectionDriverScreen({super.key});

  @override
  State<ScheduleCollectionDriverScreen> createState() =>
      _ScheduleCollectionDriverScreenState();
}

class _ScheduleCollectionDriverScreenState
    extends State<ScheduleCollectionDriverScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                  text: "Xin chào tài xế!\n",
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
                "*Lịch thu gom*",
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
            Expanded(
              child: PageView(
                controller: controller.pageControllerDriver,
                onPageChanged: controller.onPageChangedScheduleDriver,
                children: controller.itemScheduleCollectionDriver.map(
                  (title) {
                    return ListView.builder(
                      itemCount: itemCollectionTodayDatas.length,
                      itemBuilder: (context, index) {
                        final data = itemCollectionTodayDatas[index];
                        return _ItemMainScheduleCollection(
                            controller: controller,
                            collectionId: data.collectionId,
                            nameBusiness: data.nameBusiness,
                            areaTransit: data.areaTransit,
                            typeWaste: data.typeWaste,
                            contactPerson: data.contactPerson,
                            timeCollection: data.timeCollection,
                            status: data.status);
                      },
                    );
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
  _ItemMainScheduleCollection({
    super.key,
    required this.controller,
    required this.collectionId,
    required this.nameBusiness,
    required this.areaTransit,
    required this.typeWaste,
    required this.contactPerson,
    required this.timeCollection,
    required this.status,
  });

  final bool status;
  final String collectionId,
      nameBusiness,
      areaTransit,
      typeWaste,
      contactPerson,
      timeCollection;
  final DriverController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(12.0),
      width: 100.w,
      height: 45.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                HugeIcons.strokeRoundedDeliveryTruck02,
                color: status ? Colors.orange : Colors.green,
                size: 10.w,
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
                      border: Border.all(color: Colors.black, width: 1),
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
            title: "Người liên hệ:",
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
                : Text(
                    timeCollection,
                    style: PrimaryFont.titleTextBold()
                        .copyWith(color: Colors.blue),
                  ),
          ),
        ],
      ),
    );
  }
}

class _ItemInfoScheduleCollection extends StatelessWidget {
  const _ItemInfoScheduleCollection({
    super.key,
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

  _ItemListCollection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectItemScheduleDriver(title),
      child: Obx(() {
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
      }),
    );
  }
}
