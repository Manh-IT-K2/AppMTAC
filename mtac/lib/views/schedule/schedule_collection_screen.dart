import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/common/responsive_builder.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/data/schedule_screen/item_trip_collection.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';

class ScheduleCollectionScreen extends StatelessWidget {
  const ScheduleCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
            Expanded(
              child: Text(
                txtTitleSC,
                textAlign: TextAlign.center,
                style: PrimaryFont.medium(16).copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: const ResponsiveBuilder(
        portrait: Column(
          children: [
            _HeaderScheduleCollectionScreen(),
            _BodyScheduleCollectionScreen(),
          ],
        ),
        landscape: Column(
          children: [
            _HeaderScheduleCollectionScreen(),
            _BodyScheduleCollectionScreen(),
          ],
        ),
      ),
    );
  }
}

class _BodyScheduleCollectionScreen extends StatelessWidget {
  const _BodyScheduleCollectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tripData.length,
          itemBuilder: (context, index) {
            final trip = tripData[index];
            return _ItemTripCollection(
              txtCode: trip["txtCode"]!,
              txtGlandHead: trip["txtGlandHead"]!,
              txtGlandEnd: trip["txtGlandEnd"]!,
              txtType: trip["txtType"]!,
              txtDay: trip["txtDay"]!,
              txtPrice: trip["txtPrice"]!,
              onTapSchedule: () {
                Get.toNamed(AppRoutes.HANDOVERRECORD);
              },
            );
          }),
    );
  }
}

class _HeaderScheduleCollectionScreen extends StatelessWidget {
  const _HeaderScheduleCollectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: kSecondaryColor,
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          const Icon(
            Icons.error,
            color: kPrimaryColor,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            txtSubTitleSC,
            style: PrimaryFont.light(14).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _ItemTripCollection extends StatelessWidget {
  const _ItemTripCollection({
    super.key,
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
              const Icon(
                Icons.fire_truck_outlined,
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                txtTripSC,
                style: PrimaryFont.medium(14).copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtCode,
                style: PrimaryFont.medium(14).copyWith(color: Colors.black),
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
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtGlandHead,
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
              ),
              const Icon(
                Icons.forward_outlined,
                color: Colors.black,
                size: 20,
              ),
              Text(
                txtGlandEnd,
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
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
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtType,
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
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
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtDay,
                style: PrimaryFont.light(14).copyWith(color: Colors.black),
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
                style: PrimaryFont.medium(14).copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                txtPrice,
                style: PrimaryFont.medium(14).copyWith(color: Colors.black),
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
                width: 130,
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
                    style: PrimaryFont.bold(14).copyWith(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
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
                    style: PrimaryFont.bold(14).copyWith(color: kPrimaryColor),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
