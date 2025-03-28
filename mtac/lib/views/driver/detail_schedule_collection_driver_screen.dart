import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    SizedBox(height: 10,)
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
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID",
                      style: PrimaryFont.bodyTextMedium(),
                    ),
                    Text(
                      "121313",
                      style: PrimaryFont.titleTextBold(),
                    ),
                    Text(
                      "HẠNG MỤC",
                      style: PrimaryFont.bodyTextMedium(),
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
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên công ty",
                      style: PrimaryFont.bodyTextMedium(),
                    ),
                    Text(
                      "name",
                      style: PrimaryFont.titleTextBold(),
                    ),
                    Text(
                      "Ngày thu gom",
                      style: PrimaryFont.bodyTextMedium(),
                    ),
                    Text(
                      "day",
                      style: PrimaryFont.titleTextBold(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
