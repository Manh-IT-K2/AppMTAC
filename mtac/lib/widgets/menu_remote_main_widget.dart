import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mtac/controllers/menu_main_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:mtac/widgets/schedule_widget/curved_line_widget.dart';
import 'package:sizer/sizer.dart';

class MenuRemoteMainWidget extends StatefulWidget {
  final VoidCallback onClose;
  final bool isMenuOpen;
  const MenuRemoteMainWidget(
      {super.key, required this.onClose, required this.isMenuOpen});

  @override
  State<MenuRemoteMainWidget> createState() => _MenuRemoteMainWidgetState();
}
late int selectedIndex;
class _MenuRemoteMainWidgetState extends State<MenuRemoteMainWidget> {
  @override
  void initState() {
    super.initState();
    selectedIndex = Get.arguments ?? 0;
    isMenuOpen = true;
  }

  //
  bool isMenuOpen = false;
  Offset dragStart = Offset.zero;

  void toggleMenu() {
    setState(() {
      widget.onClose();
    });
  }

  void onDragStart(DragStartDetails details) {
    setState(() {
      dragStart = details.globalPosition;
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    double dragDistance = details.globalPosition.dx - dragStart.dx;

    setState(() {
      if (isMenuOpen && dragDistance > 50) {
        toggleMenu();
      }
    });
  }

  final menuController = Get.put(MenuMainController());

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: widget.isMenuOpen ? 0 : -60.w,
      top: 5,
      bottom: 0,
      child: GestureDetector(
        onHorizontalDragStart: onDragStart,
        onHorizontalDragUpdate: onDragUpdate,
        child: Container(
          width: 60.w,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(-2, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.w,
              ),
              const ItemMenuHeader(
                titleHeader: "Lịch thu gom",
                icon: HugeIcons.strokeRoundedCalendar03,
              ),
              ItemMenuBody(
                height: 10.h,
                title1: "Lịch gom hôm nay",
                title2: "Lịch gom đã sắp",
                title3: "Lịch gom chưa sắp",
                isSelected1: menuController.selectedIndex.value == 0,
                isSelected2: menuController.selectedIndex.value == 1,
                isSelected3: menuController.selectedIndex.value == 2,
                numberNoti1: "3",
                numberNoti2: "0",
                numberNoti3: "8",
                item4: false,
                onTap1: () {
                  menuController.setIndex(0);
                  toggleMenu();
                  Get.toNamed(AppRoutes.scheduleCollectionToday);
                },
                onTap2: () {
                  menuController.setIndex(1);
                  toggleMenu();
                  Get.toNamed(AppRoutes.scheduleCollectionArranged);
                },
                onTap3: () {
                  menuController.setIndex(2);
                  toggleMenu();
                  Get.toNamed(AppRoutes.scheduleCollectionNotYet);
                },
              ),
              SizedBox(
                height: 5.w,
              ),
              //
              const ItemMenuHeader(
                titleHeader: "Bảng kê",
                icon: HugeIcons.strokeRoundedAnalysisTextLink,
              ),
              ItemMenuBody(
                height: 10.h,
                title1: "Gửi bảng kê",
                title2: "Bảng kê đã gửi",
                title3: "Bảng kê trả lại",
                isSelected1: menuController.selectedIndex.value == 3,
                isSelected2: menuController.selectedIndex.value == 4,
                isSelected3: menuController.selectedIndex.value == 5,
                numberNoti1: "3",
                numberNoti2: "0",
                numberNoti3: "8",
                item4: false,
                onTap1: () {
                 
                },
                onTap2: () {
                 
                },
                onTap3: () {
                  
                },
              ),
              SizedBox(
                height: 5.w,
              ),
              //
              const ItemMenuHeader(
                titleHeader: "Hợp đồng",
                icon: HugeIcons.strokeRoundedContracts,
              ),
              ItemMenuBody(
                height: 14.h,
                title1: "Hợp đồng còn hạn",
                title2: "Hợp đồng hết hạn",
                title3: "Xác nhận hợp đồng",
                title4: "Bổ sung phụ lục",
                isSelected1: menuController.selectedIndex.value == 6,
                isSelected2: menuController.selectedIndex.value == 7,
                isSelected3: menuController.selectedIndex.value == 8,
                isSelected4: menuController.selectedIndex.value == 9,
                numberNoti1: "3",
                numberNoti2: "0",
                numberNoti3: "8",
                numberNoti4: "0",
                item4: true,
                onTap1: () {
                  
                },
                onTap2: () {
                 
                },
                onTap3: () {
                  
                },
                onTap4: () {
                  
                },
              ),

              //
              SizedBox(
                height: 5.w,
              ),

              //
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    HugeIcons.strokeRoundedDollarSquare,
                    size: 5.w,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Công nợ',
                    style: PrimaryFont.bodyTextBold()
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 5.w,
              ),
              //
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    HugeIcons.strokeRoundedAlertSquare,
                    size: 5.w,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Thông tin xe',
                    style: PrimaryFont.bodyTextBold()
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 5.w,
              ),
              //
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    HugeIcons.strokeRoundedShieldUser,
                    size: 5.w,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Năng lực nhà thầu',
                    style: PrimaryFont.bodyTextBold()
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemMenuBody extends StatelessWidget {
  ItemMenuBody(
      {super.key,
      required this.isSelected1,
      required this.isSelected2,
      required this.isSelected3,
      required this.numberNoti1,
      required this.title1,
      required this.numberNoti2,
      required this.title2,
      required this.numberNoti3,
      required this.title3,
      this.numberNoti4,
      this.title4,
      required this.item4,
      this.onTap1,
      this.onTap2,
      this.onTap3,
      this.onTap4,
      this.height,
      this.isSelected4});

  bool isSelected1, isSelected2, isSelected3, item4;
  bool? isSelected4;
  final String numberNoti1, title1, numberNoti2, title2, numberNoti3, title3;
  final String? numberNoti4, title4;
  Function()? onTap1, onTap2, onTap3, onTap4;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 7.w),
          width: 1,
          height: height,
          color: Colors.grey,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.w,
            ),
            Row(
              children: [
                CustomPaint(
                  size: const Size(30, 0),
                  painter: CurvedLineWidget(),
                ),
                ItemMenu(
                  title: title1,
                  isSelected: isSelected1,
                  numberNoti: numberNoti1,
                  onTap: onTap1,
                ),
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            Row(
              children: [
                CustomPaint(
                  size: const Size(30, 0),
                  painter: CurvedLineWidget(),
                ),
                ItemMenu(
                  title: title2,
                  isSelected: isSelected2,
                  numberNoti: numberNoti2,
                  onTap: onTap2,
                )
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            Row(
              children: [
                CustomPaint(
                  size: const Size(30, 0),
                  painter: CurvedLineWidget(),
                ),
                ItemMenu(
                  title: title3,
                  isSelected: isSelected3,
                  numberNoti: numberNoti3,
                  onTap: onTap3,
                ),
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            item4
                ? Row(
                    children: [
                      CustomPaint(
                        size: const Size(30, 0),
                        painter: CurvedLineWidget(),
                      ),
                      ItemMenu(
                        title: title4!,
                        isSelected: isSelected4!,
                        numberNoti: numberNoti4!,
                        onTap: onTap4,
                      ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}

class ItemMenuHeader extends StatelessWidget {
  const ItemMenuHeader({
    super.key,
    required this.titleHeader,
    required this.icon,
  });
  final String titleHeader;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        Icon(
          icon,
          size: 5.w,
          color: Colors.white,
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          titleHeader,
          style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ItemMenu extends StatelessWidget {
  ItemMenu({
    super.key,
    required this.isSelected,
    required this.numberNoti,
    required this.title,
    this.onTap,
  });
  bool isSelected;
  final String numberNoti, title;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isSelected
          ? Container(
              width: 40.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5.w),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: PrimaryFont.bodyTextMedium()
                        .copyWith(color: Colors.white),
                  ),
                  !numberNoti.contains("0")
                      ? Container(
                          width: 5.w,
                          height: 5.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Text(
                            numberNoti,
                            style: PrimaryFont.bodyTextBold()
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: PrimaryFont.bodyTextMedium()
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  width: 5.w,
                ),
                !numberNoti.contains("0")
                    ? Container(
                        width: 5.w,
                        height: 5.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Text(
                          numberNoti,
                          style: PrimaryFont.bodyTextBold()
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
    );
  }
}
