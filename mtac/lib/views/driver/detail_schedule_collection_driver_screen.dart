import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class DetailScheduleCollectionDriverScreen extends StatelessWidget {
  const DetailScheduleCollectionDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 5.w,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thông tin chi tiết",
                style: PrimaryFont.headerTextBold(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3.w),
                width: 100.w,
                //height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ItemInforDetail(
                      title: "Tên công ty",
                      subTitle: "Công ty TNHH Active Creation",
                    ),
                    _ItemRowInforDetail(
                      title1: "Ngày thu gom",
                      subTitle1: "06-01-2025",
                      title2: "Biển số xe",
                      subTitle2: "50H-04282",
                    ),
                    _ItemInforDetail(
                      title: "Địa chỉ thu gom",
                      subTitle:
                          "359A, Ấp Long Bình, Xã Long Hiệp, Huyện Biên Lức, Tỉnh Long An",
                    ),
                    _ItemRowInforDetail(
                      title1: "Thời gian thu gom",
                      subTitle1: "null",
                      title2: "Loại hàng",
                      subTitle2: "Chất thải nguy hại",
                    ),
                    _ItemInforDetail(
                      title: "Khu vực vận chuyển",
                      subTitle: "Thủ Thừa(Long An) => Bình Tân(TP.HCM)",
                    ),
                    _ItemRowInforDetail(
                      title1: "Ngày gửi lịch gom",
                      subTitle1: "05-01-2025",
                      title2: "Đơn giá vận chuyển",
                      subTitle2: "2,400,000,00",
                    ),
                    _ItemInforDetail(
                      title: "Số lượng nhân công",
                      subTitle: "Nguyễn Văn A, Lê Văn B",
                    ),
                    _ItemRowInforDetail(
                      title1: "Thông tin người liên hệ",
                      subTitle1: "Chị Giao",
                      title2: "Trạng thái công nợ",
                      subTitle2: "Chưa nghiệm thu",
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Text(
                "Danh sách chi phí đi kèm",
                style: PrimaryFont.headerTextBold(),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 3.w),
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 3.w),
                      width: 30.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(3.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(2, 2),
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 5.w,
                          ),
                          Text(
                            "Thêm chi phí",
                            style: PrimaryFont.bodyTextBold()
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 3.w,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.w,
                            ),
                            _ItemListCost(),
                            _ItemListCost(),
                            _ItemListCost(),
                            _ItemListCost(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Danh sách hành hoá",
                style: PrimaryFont.headerTextBold(),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 3.w),
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 5.w,
                      ),
                      _ItemListCost(),
                      _ItemListCost(),
                      _ItemListCost(),
                      _ItemListCost(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                        height: 5.w,
                      ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemListCost extends StatelessWidget {
  const _ItemListCost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100.w,
          margin: EdgeInsets.only(bottom: 5.w),
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kPrimaryColor.withOpacity(0.2), width: 1),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hạng mục: ",
                    style: PrimaryFont.bodyTextMedium(),
                  ),
                  Text(
                    "Thuê nhân công",
                    style: PrimaryFont.bodyTextBold(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Đơn giá: ",
                    style: PrimaryFont.bodyTextMedium(),
                  ),
                  Text(
                    "280,000,00",
                    style: PrimaryFont.bodyTextBold(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Số lượng: ",
                    style: PrimaryFont.bodyTextMedium(),
                  ),
                  Text(
                    "2,00",
                    style: PrimaryFont.bodyTextBold(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Thành tiền: ",
                    style: PrimaryFont.bodyTextMedium(),
                  ),
                  Text(
                    "560,000,00",
                    style: PrimaryFont.bodyTextBold(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Ghi chú: ",
                    style: PrimaryFont.bodyTextMedium(),
                  ),
                  Text(
                    "Đi chung CN với Bibica",
                    style: PrimaryFont.bodyTextBold(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Trạng thái: ",
                    style: PrimaryFont.bodyTextMedium(),
                  ),
                  Text(
                    "Chưa nghiệm thu",
                    style:
                        PrimaryFont.bodyTextBold().copyWith(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border:
                  Border.all(color: kPrimaryColor.withOpacity(0.2), width: 1),
              borderRadius: BorderRadius.circular(3.w),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text(
              "121313",
              style: PrimaryFont.bodyTextBold().copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemInforDetail extends StatelessWidget {
  const _ItemInforDetail({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      width: 100.w,
      height: 14.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: PrimaryFont.bodyTextMedium(),
          ),
          Text(
            subTitle,
            style: PrimaryFont.bodyTextBold(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ItemRowInforDetail extends StatelessWidget {
  const _ItemRowInforDetail({
    super.key,
    required this.title1,
    required this.title2,
    required this.subTitle1,
    required this.subTitle2,
  });
  final String title1, title2, subTitle1, subTitle2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100.w,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            width: 42.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title1,
                  style: PrimaryFont.bodyTextMedium(),
                ),
                Text(
                  subTitle1,
                  style: PrimaryFont.bodyTextBold(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            width: 42.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title2,
                  style: PrimaryFont.bodyTextMedium(),
                ),
                Text(
                  subTitle2,
                  style: PrimaryFont.bodyTextBold(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
