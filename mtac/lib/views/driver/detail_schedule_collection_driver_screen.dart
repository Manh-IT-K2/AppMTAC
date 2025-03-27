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
              Text("Thông tin chi tiết", style: PrimaryFont.headerTextBold(),),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 3.w),
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tên công ty", style: PrimaryFont.bodyTextMedium(),),
                    Text("name", style: PrimaryFont.titleTextBold(),),
                    Text("Ngày thu gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("day", style: PrimaryFont.titleTextBold(),),
                    Text("Thời gian thu gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("null", style: PrimaryFont.titleTextBold(),),
                    Text("Biển số xe", style: PrimaryFont.bodyTextMedium(),),
                    Text("number Plate", style: PrimaryFont.titleTextBold(),),
                    Text("Địa chỉ thu gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("address", style: PrimaryFont.titleTextBold(),),
                    Text("Ngày gửi lịch gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("senđaycollec", style: PrimaryFont.titleTextBold(),),
                    Text("Số lượng nhận công", style: PrimaryFont.bodyTextMedium(),),
                    Text("numberWorker", style: PrimaryFont.titleTextBold(),),
                    Text("Khu vực vận chuyển", style: PrimaryFont.bodyTextMedium(),),
                    Text("area", style: PrimaryFont.titleTextBold(),),
                    Text("Loại hàng", style: PrimaryFont.bodyTextMedium(),),
                    Text("typeGoods", style: PrimaryFont.titleTextBold(),),
                    Text("Đơn giá vận chuyển", style: PrimaryFont.bodyTextMedium(),),
                    Text("200000", style: PrimaryFont.titleTextBold(),),
                    Text("Thông tin người liên hệ", style: PrimaryFont.bodyTextMedium(),),
                    Text("Chị Giao", style: PrimaryFont.titleTextBold(),),
                    Text("Trạng thái công nợ", style: PrimaryFont.bodyTextMedium(),),
                    Text("chưa nghiệm thu", style: PrimaryFont.titleTextBold(),),
                  ],
                ),
              ),
              Text("Danh sách chi phí đi kèm", style: PrimaryFont.headerTextBold(),),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 3.w),
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID", style: PrimaryFont.bodyTextMedium(),),
                    Text("121313", style: PrimaryFont.titleTextBold(),),
                    Text("HẠNG MỤC", style: PrimaryFont.bodyTextMedium(),),
                    Text("Thuê nhân công", style: PrimaryFont.titleTextBold(),),
                    Text("ĐƠN GIÁ", style: PrimaryFont.bodyTextMedium(),),
                    Text("280,000,00", style: PrimaryFont.titleTextBold(),),
                    Text("SỐ LƯỢNG", style: PrimaryFont.bodyTextMedium(),),
                    Text("2.00", style: PrimaryFont.titleTextBold(),),
                    Text("THÀNH TIỀN", style: PrimaryFont.bodyTextMedium(),),
                    Text("560,000,00", style: PrimaryFont.titleTextBold(),),
                    Text("GHI CHÚ", style: PrimaryFont.bodyTextMedium(),),
                    Text("Đi chung CN với Bibica", style: PrimaryFont.titleTextBold(),),
                    Text("TRẠNG THÁI", style: PrimaryFont.bodyTextMedium(),),
                    Text("Chưa nghiệm thu", style: PrimaryFont.titleTextBold(),),  
                  ],
                ),
              ),
              Text("Danh sách hành hoá", style: PrimaryFont.headerTextBold(),),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 3.w),
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tên công ty", style: PrimaryFont.bodyTextMedium(),),
                    Text("name", style: PrimaryFont.titleTextBold(),),
                    Text("Ngày thu gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("day", style: PrimaryFont.titleTextBold(),),
                    Text("Thời gian thu gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("null", style: PrimaryFont.titleTextBold(),),
                    Text("Biển số xe", style: PrimaryFont.bodyTextMedium(),),
                    Text("number Plate", style: PrimaryFont.titleTextBold(),),
                    Text("Địa chỉ thu gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("address", style: PrimaryFont.titleTextBold(),),
                    Text("Ngày gửi lịch gom", style: PrimaryFont.bodyTextMedium(),),
                    Text("senđaycollec", style: PrimaryFont.titleTextBold(),),
                    Text("Số lượng nhận công", style: PrimaryFont.bodyTextMedium(),),
                    Text("numberWorker", style: PrimaryFont.titleTextBold(),),
                    Text("Khu vực vận chuyển", style: PrimaryFont.bodyTextMedium(),),
                    Text("area", style: PrimaryFont.titleTextBold(),),
                    Text("Loại hàng", style: PrimaryFont.bodyTextMedium(),),
                    Text("typeGoods", style: PrimaryFont.titleTextBold(),),
                    Text("Đơn giá vận chuyển", style: PrimaryFont.bodyTextMedium(),),
                    Text("200000", style: PrimaryFont.titleTextBold(),),
                    Text("Thông tin người liên hệ", style: PrimaryFont.bodyTextMedium(),),
                    Text("Chị Giao", style: PrimaryFont.titleTextBold(),),
                    Text("Trạng thái công nợ", style: PrimaryFont.bodyTextMedium(),),
                    Text("chưa nghiệm thu", style: PrimaryFont.titleTextBold(),),
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
