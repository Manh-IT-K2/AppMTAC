import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/common/responsive_builder.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/data/home_screen/menu_item.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final size = context.screenSize;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chào, Trần Đức Thanh",
                style: PrimaryFont.bold(20).copyWith(color: Colors.black)),
            const SizedBox(
              height: 6,
            ),
            Text(txtMTAC,
                style: PrimaryFont.light(14).copyWith(color: Colors.black)),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
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
            child: ResponsiveBuilder(
              portrait: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderHomeScreen(
                    sWidthMoney: size.width *0.55,
                    sHeightMoney: size.height * 0.05,
                    sHeightRevenue: size.height * 0.15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const _BodyHomeScreen(),
                  const SizedBox(
                    height: 30,
                  ),
                  _BottomHomeScreen(sHeightTransport: size.height * 0.2),
                ],
              ),
              landscape: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderHomeScreen(
                    sWidthMoney: size.width *0.3,
                    sHeightMoney: size.height * 0.1,
                    sHeightRevenue: size.height * 0.3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const _BodyHomeScreen(),
                  const SizedBox(
                    height: 30,
                  ),
                  _BottomHomeScreen(sHeightTransport: size.height * 0.4),
                ],
              ),
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
        const Text(
          txtInviteTransport,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
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
                Get.toNamed(AppRoutes.SCHEDULECOLLECTION);
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
                  style: PrimaryFont.medium(14).copyWith(color: kPrimaryColor),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              _TextMoney(
                title: txtRevenue,
                balance: txtNumberMoney,
                size: 23,
              ),
              Spacer(),
              _TextMoney(
                title: txtYesterday,
                balance: txtNumberMoney,
                size: 12,
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
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
        ),
        Text(
          balance,
          style: TextStyle(
              color: Colors.white, fontSize: size, fontWeight: FontWeight.w900),
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
      width: 200,
      height: 156,
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
              width: 200,
              height: 90,
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
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
      width: 80,
      child: Column(
        children: [
          checkNoti
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Text(
                      numberNoti,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : const SizedBox(
                  width: 20,
                  height: 20,
                ),
          Icon(
            icons,
            color: Colors.black,
            size: 24,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
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
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
