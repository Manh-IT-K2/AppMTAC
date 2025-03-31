import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/data/schedule_screen/item_cost_collection.dart';
import 'package:mtac/data/schedule_screen/item_merchandise_collection.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class DetailScheduleCollectionAdminScreen extends StatelessWidget {
  const DetailScheduleCollectionAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String daySendCollection = arguments["daySendCollection"] ?? "";
    final String nameBusiness = arguments["nameBusiness"] ?? "";
    final String areaTransit = arguments["areaTransit"] ?? "";
    final String typeWaste = arguments["typeWaste"] ?? "";
    final String contactPerson = arguments["contactPerson"] ?? "";
    final String timeCollection = arguments["timeCollection"] ?? "";
    final String numberPlate = arguments["numberPlate"] ?? "";
    final String addressCollection = arguments["addressCollection"] ?? "";
    final String debtStatus = arguments["debtStatus"] ?? "";
    final String dayCollection = arguments["dayCollection"] ?? "";
    final String costTransit = arguments["costTransit"] ?? "";
    final List<String>? imageList = arguments["image"] as List<String>? ?? [];
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ItemInforDetail(
                      title: "Tên công ty",
                      subTitle: nameBusiness,
                    ),
                    _ItemRowInforDetail(
                      title1: "Ngày thu gom",
                      subTitle1: dayCollection,
                      title2: "Biển số xe",
                      subTitle2: numberPlate,
                    ),
                    _ItemInforDetail(
                      title: "Địa chỉ thu gom",
                      subTitle:
                          addressCollection,
                    ),
                    _ItemRowInforDetail(
                      title1: "Thời gian thu gom",
                      subTitle1: timeCollection,
                      title2: "Loại hàng",
                      subTitle2: typeWaste,
                    ),
                    _ItemInforDetail(
                      title: "Khu vực vận chuyển",
                      subTitle: areaTransit,
                    ),
                    _ItemRowInforDetail(
                      title1: "Ngày gửi lịch gom",
                      subTitle1: daySendCollection,
                      title2: "Đơn giá vận chuyển",
                      subTitle2: costTransit,
                    ),
                    const _ItemInforDetail(
                      title: "Số lượng nhân công",
                      subTitle: "Nguyễn Văn A, Lê Văn B",
                    ),
                    _ItemRowInforDetail(
                      title1: "Thông tin người liên hệ",
                      subTitle1: contactPerson,
                      title2: "Trạng thái công nợ",
                      subTitle2: debtStatus,
                    ),
                    const SizedBox(
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
                      child: ListView.builder(
                        itemCount: listCostData.length,
                        itemBuilder: (context, index) {
                          final data = listCostData[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _ItemListCost(
                                id: data.id,
                                category: data.category,
                                cost: data.cost,
                                quantity: data.quantity,
                                totalMoney: data.totalMoney,
                                note: data.note,
                                status: data.status),
                          );
                        },
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
                child: ListView.builder(
                  itemCount: listMerchandiseData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = listMerchandiseData[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _ItemMerchandise(
                          id: data.id,
                          nameGoods: data.nameGoods,
                          idGoods: data.idGoods,
                          totalWeight: data.totalWeight,
                          warehouse: data.warehouse,
                          processingOwner: data.processingOwner),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.w,
              ),
              imageList != null
                  ? Text(
                      "Hình ảnh thu gom",
                      style: PrimaryFont.headerTextBold(),
                    )
                  : const SizedBox(),
              imageList != null
                  ? SizedBox(
                      width: 100.w,
                      height: 30.w,
                      child: ListView.builder(
                        itemCount: imageList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(2.w),
                            child: Image.network(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ))
                  : const SizedBox(),
              SizedBox(
                height: 10.w,
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
    required this.id,
    required this.category,
    required this.cost,
    required this.quantity,
    required this.totalMoney,
    required this.note,
    required this.status,
  });

  final String id, category, cost, quantity, totalMoney, note, status;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100.w,
          margin: EdgeInsets.only(bottom: 2.w),
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kPrimaryColor.withOpacity(0.2), width: 1),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ItemTable(
                title: "Hạng mục: ",
                subTitle: category,
              ),
              _ItemTable(
                title: "Đơn giá: ",
                subTitle: cost,
              ),
              _ItemTable(
                title: "Số Lượng",
                subTitle: quantity,
              ),
              _ItemTable(
                title: "Thành tiền: ",
                subTitle: totalMoney,
              ),
              _ItemTable(
                title: "Ghi chú: ",
                subTitle: note,
              ),
              _ItemTable(
                title: "Trạng thái: ",
                subTitle: status,
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
              id,
              style: PrimaryFont.bodyTextBold().copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemMerchandise extends StatelessWidget {
  const _ItemMerchandise({
    super.key,
    required this.id,
    required this.nameGoods,
    required this.idGoods,
    required this.totalWeight,
    required this.warehouse,
    required this.processingOwner,
  });

  final String id, nameGoods, idGoods, totalWeight, warehouse, processingOwner;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100.w,
          margin: EdgeInsets.only(bottom: 2.w),
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kPrimaryColor.withOpacity(0.2), width: 1),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ItemTable(
                title: "Tên hàng hoá: ",
                subTitle: nameGoods,
              ),
              _ItemTable(
                title: "Mã hàng hoá: ",
                subTitle: idGoods,
                color: Colors.red,
              ),
              _ItemTable(
                title: "KL Gom - Kg: ",
                subTitle: totalWeight,
              ),
              _ItemTable(
                title: "Kho nhập: ",
                subTitle: warehouse,
              ),
              _ItemTable(
                title: "Chờ xử lý: ",
                subTitle: processingOwner,
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
              id,
              style: PrimaryFont.bodyTextBold().copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemTable extends StatelessWidget {
  const _ItemTable({
    super.key,
    required this.title,
    required this.subTitle,
    this.color,
  });

  final String title, subTitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: PrimaryFont.bodyTextMedium(),
        ),
        Expanded(
          child: Text(
            subTitle,
            style: PrimaryFont.bodyTextBold().copyWith(color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
