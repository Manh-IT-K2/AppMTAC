import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/data/home_screen/menu_item.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
                left: 12, bottom: 10),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chào, Trần Đức Thanh",
                  style: PrimaryFont.headerTextBold()
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 6),
                Text(
                  txtMTAC,
                  style:
                      PrimaryFont.bodyTextLight().copyWith(color: Colors.black),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderHomeScreen(
                  sWidthMoney: 50.w,
                  sHeightMoney: 5.h,
                  sHeightRevenue: 15.h,
                ),
                const SizedBox(
                  height: 30,
                ),
                const _BodyHomeScreen(),
                const SizedBox(
                  height: 30,
                ),
                _BottomHomeScreen(sHeightTransport: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomHomeScreen extends StatelessWidget {
  const _BottomHomeScreen({
    super.key,
    required this.sHeightTransport,
  });

  final double sHeightTransport;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txtInviteTransport,
          style: PrimaryFont.headerTextBold().copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: double.infinity,
          height: sHeightTransport,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: GestureDetector(
                  onTap: () {
                    Get.snackbar(
                      "Notification",
                      "You clicked: function is being performed",
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.blue.withOpacity(0.8),
                      colorText: Colors.white,
                    );
                  },
                  child: const _ItemInviteTransport(
                    image:
                        "https://moitruongachau.com/vnt_upload/quisle/07_2022/z3568321784195_18891717b27f71f34f4f974c0644dc67.jpg",
                    text:
                        "Mời thầu vận chuyển vải vụn, nguyên, nhiên liệu thay thế phục vụ ngành xi măng, tại khu vực miền tây (tuyến tiền giang - tp. hồ chí minh)",
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BodyHomeScreen extends StatelessWidget {
  const _BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 12,
        alignment: WrapAlignment.start,
        children: List.generate(menuItemHome.length, (index) {
          final item = menuItemHome[index];
          return InkWell(
            onTap: () {
              if (item["text"] == "Sắp lịch") {
                Get.toNamed(AppRoutes.SCHEDULE);
              } else if (item["text"] == "Tài xế"){
                Get.toNamed(AppRoutes.DRIVER);
              } else if (item["text"] == "Năng lực"){
                //Get.toNamed(AppRoutes.SCHEDULECOLLECTIONARRANGED);
              }
              // Get.snackbar(
              //   "Notification",
              //   "You clicked: ${item["text"]}",
              //   snackPosition: SnackPosition.TOP,
              //   duration: const Duration(seconds: 2),
              //   backgroundColor: Colors.blue.withOpacity(0.8),
              //   colorText: Colors.white,
              // );
            },
            child: _ItemFunction(
              numberNoti: item["numberNoti"],
              icons: item["icons"],
              text: item["text"],
              checkNoti: item["checkNoti"],
            ),
          );
        }),
      ),
    );
  }
}

class _HeaderHomeScreen extends StatelessWidget {
  const _HeaderHomeScreen({
    super.key,
    required this.sWidthMoney,
    required this.sHeightMoney,
    required this.sHeightRevenue,
  });

  final double sWidthMoney, sHeightMoney, sHeightRevenue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: sWidthMoney,
          height: sHeightMoney,
          margin: const EdgeInsets.only(bottom: 20, top: 20),
          decoration: const BoxDecoration(
            color: Color(0xffE3F2FD),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.monetization_on_outlined,
                  color: kPrimaryColor, size: 24),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  "100,000,000,000 đ",
                  style: PrimaryFont.bodyTextMedium()
                      .copyWith(color: kPrimaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Get.snackbar(
                    "Notification",
                    "Function is being perfomed",
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.blue.withOpacity(0.8),
                    colorText: Colors.white,
                  );
                },
                child: const Icon(Icons.keyboard_arrow_right,
                    color: kPrimaryColor, size: 24),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: sHeightRevenue,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [kPrimaryColor, Color(0xFF81B0FF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 10.w,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              _TextMoney(
                title: txtRevenue,
                balance: txtNumberMoney,
                size: 5.w,
              ),
              const Spacer(),
              _TextMoney(
                title: txtYesterday,
                balance: txtNumberMoney,
                size: 3.w,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _TextSchedule(
              number: txtNumberInfoSchedule1,
              text: txtInfoSchedule1,
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 2,
              height: 20,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 30,
            ),
            const _TextSchedule(
              number: txtNumberInfoSchedule2,
              text: txtInfoSchedule2,
            ),
          ],
        ),
      ],
    );
  }
}

class _TextMoney extends StatelessWidget {
  const _TextMoney(
      {required this.size, required this.title, required this.balance});

  final double size;
  final String title;
  final String balance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: PrimaryFont.bodyTextLight().copyWith(color: Colors.white),
        ),
        Text(
          balance,
          style: PrimaryFont.bold(size).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class _ItemInviteTransport extends StatelessWidget {
  const _ItemInviteTransport({
    required this.image,
    required this.text,
  });

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 20.h,
      decoration: const BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              image,
              width: 50.w,
              height: 9.h,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              text,
              style: PrimaryFont.bodyTextBold().copyWith(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemFunction extends StatelessWidget {
  const _ItemFunction(
      {required this.numberNoti,
      required this.icons,
      required this.text,
      required this.checkNoti});

  final String numberNoti;
  final IconData icons;
  final String text;
  final bool checkNoti;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18.w,
      child: Column(
        children: [
          checkNoti
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 5.w,
                    height: 5.w,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(1000),
                      ),
                    ),
                    child: Text(
                      numberNoti,
                      style: PrimaryFont.bodyTextMedium()
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : SizedBox(
                  width: 5.w,
                  height: 5.w,
                ),
          Icon(
            icons,
            color: Colors.black,
            size: 8.w,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            text,
            style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _TextSchedule extends StatelessWidget {
  const _TextSchedule({
    required this.number,
    required this.text,
  });
  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number,
          style: PrimaryFont.bodyTextBold().copyWith(color: Colors.black),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
