import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/controllers/schedule/schedule_notyet_controller.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:mtac/widgets/base_will_pop_widget.dart';
import 'package:mtac/widgets/menu_remote_main_widget.dart';
import 'package:sizer/sizer.dart';

class ScheduleCollectionNotYetScreen extends StatefulWidget {
  const ScheduleCollectionNotYetScreen({super.key});

  @override
  State<ScheduleCollectionNotYetScreen> createState() =>
      _ScheduleCollectionNotYetScreenState();
}

class _ScheduleCollectionNotYetScreenState
    extends State<ScheduleCollectionNotYetScreen> {
  bool showMenu = false;
  void toggleMenu() {
    setState(() {
      showMenu = !showMenu;
    });
  }

  final ScheduleNotyetController controller =
      Get.put(ScheduleNotyetController());

  @override
  Widget build(BuildContext context) {
    return BaseWillPopWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 5.w,
                ),
              ),
              Expanded(
                child: Text(
                  txtTitleSC,
                  textAlign: TextAlign.center,
                  style: PrimaryFont.headerTextBold()
                      .copyWith(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  toggleMenu();
                  //print("hello ${controller.isMenuOpen.value}");
                },
                child: Container(
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
                    ],
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 5.w,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
        ),
        body: Stack(children: [
          Column(
            children: [
              const _HeaderScheduleCollectionAdminScreen(),
              _BodyScheduleCollectionAdminScreen(controller: controller),
            ],
          ),
          // Menu glide from right
          MenuRemoteMainWidget(
            isMenuOpen: showMenu,
            onClose: toggleMenu,
          ),
        ]),
      ),
    );
  }
}

class _BodyScheduleCollectionAdminScreen extends StatelessWidget {
  const _BodyScheduleCollectionAdminScreen({required this.controller});

  final ScheduleNotyetController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final trip = controller.allItemsScheduleNotYet[index];
                  final areaParts = trip.areaTransit.split('=>');
                  final glandHead = areaParts[0].trim();
                  final glandEnd =
                      areaParts.length > 1 ? areaParts[1].trim() : '';
                  //print("object ${trip.areaTransit}");
                  return _ItemTripCollection(
                    txtCode: trip.collectionId,
                    txtGlandHead: glandHead,
                    txtGlandEnd: glandEnd,
                    txtType: trip.typeWaste,
                    txtDay: trip.dayCollection,
                    txtPrice: trip.costTransit,
                    onTapSchedule: () {
                      //Get.toNamed(AppRoutes.MAP);
                    },
                  );
                },
                childCount: controller.allItemsScheduleNotYet.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderScheduleCollectionAdminScreen extends StatelessWidget {
  const _HeaderScheduleCollectionAdminScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      color: kSecondaryColor,
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Icon(
            Icons.error,
            color: kPrimaryColor,
            size: 5.w,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            txtSubTitleSC,
            style: PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _ItemTripCollection extends StatelessWidget {
  const _ItemTripCollection({
    required this.txtCode,
    required this.txtGlandHead,
    required this.txtGlandEnd,
    required this.txtType,
    required this.txtDay,
    required this.txtPrice,
    this.onTapDetail,
    this.onTapSchedule,
  });

  final String txtCode, txtGlandHead, txtGlandEnd, txtType, txtDay, txtPrice;
  final Function()? onTapSchedule, onTapDetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      color: kBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Icon(
                Icons.fire_truck_outlined,
                color: Colors.black,
                size: 5.w,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                txtTripSC,
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtCode,
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            height: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                txtGlandSC,
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtGlandHead,
                style:
                    PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
              ),
              Icon(
                Icons.forward_outlined,
                color: Colors.black,
                size: 3.w,
              ),
              Text(
                txtGlandEnd,
                style:
                    PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                txtTypSC,
                style:
                    PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtType,
                style:
                    PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                txtDaySC,
                style:
                    PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtDay,
                style:
                    PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                txtPriceSC,
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtPrice,
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                width: 35.w,
                height: 5.h,
                child: OutlinedButton(
                  onPressed: onTapDetail,
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    txtButDetailSC,
                    style:
                        PrimaryFont.bodyTextBold().copyWith(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: SizedBox(
                  height: 5.h,
                  child: OutlinedButton(
                    onPressed: onTapSchedule,
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: kPrimaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: Text(
                      txtButScheduleSC,
                      style: PrimaryFont.bodyTextBold()
                          .copyWith(color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
        ],
      ),
    );
  }
}
