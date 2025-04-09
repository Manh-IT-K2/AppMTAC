import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/data/schedule_screen/item_cost_collection.dart';
import 'package:mtac/data/schedule_screen/item_merchandise_collection.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class DetailScheduleCollectionAdminScreen extends StatefulWidget {
  const DetailScheduleCollectionAdminScreen({super.key});

  @override
  State<DetailScheduleCollectionAdminScreen> createState() => _DetailScheduleCollectionAdminScreenState();
}

class _DetailScheduleCollectionAdminScreenState extends State<DetailScheduleCollectionAdminScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
    final List<String>? imageList = arguments["image"] as List<String>? ?? null;
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
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.w,
                    ),
                    _ItemInforDetail(
                      title: "Tên công ty: ",
                      subTitle: nameBusiness,
                    ),
                    _ItemInforDetail(
                      title: "Ngày thu gom: ",
                      subTitle: dayCollection,
                    ),
                    _ItemInforDetail(
                      title: "Biển số xe: ",
                      subTitle: numberPlate,
                    ),
                    _ItemInforDetail(
                      title: "Thời gian thu gom: ",
                      subTitle: timeCollection,
                    ),
                    _ItemInforDetail(
                      title: "Loại hàng: ",
                      subTitle: typeWaste,
                    ),
                    _ItemInforDetail(
                      title: "Ngày gửi lịch gom: ",
                      subTitle: daySendCollection,
                    ),
                    _ItemInforDetail(
                      title: "Đơn giá vận chuyển: ",
                      subTitle: costTransit,
                    ),
                    _ItemInforDetail(
                      title: "Thông tin người liên hệ: ",
                      subTitle: contactPerson,
                    ),
                    _ItemInforDetail(
                      title: "Trạng thái công nợ: ",
                      subTitle: debtStatus,
                    ),
                    const _ItemInforDetail(
                      title: "Số lượng nhân công: ",
                      subTitle:
                          "Nguyễn Văn A, Lê Văn B Nguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn BNguyễn Văn A, Lê Văn B",
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    _ItemInforDetail(
                      title: "Địa chỉ thu gom: ",
                      subTitle: addressCollection,
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    _ItemInforDetail(
                      title: "Khu vực vận chuyển: ",
                      subTitle: areaTransit,
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
                //padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 3.w),
                width: 100.w,
                height: 50.h,

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
                    SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: const [
              _HeaderItem(title: "ID", width: 80),
              _HeaderItem(title: "Hạng mục", width: 100),
              _HeaderItem(title: "Đơn giá", width: 80),
              _HeaderItem(title: "Số lượng", width: 80),
              _HeaderItem(title: "Thành tiền", width: 100),
              _HeaderItem(title: "Ghi chú", width: 120),
              _HeaderItem(title: "Trạng thái", width: 100),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // List content
        Expanded(
          child: ListView.builder(
            itemCount: listCostData.length,
            itemBuilder: (context, index) {
              final data = listCostData[index];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Row(
                  children: [
                    _CellItem(text: data.id, width: 80),
                    _CellItem(text: data.category, width: 100),
                    _CellItem(text: data.cost, width: 80),
                    _CellItem(text: data.quantity, width: 80),
                    _CellItem(text: data.totalMoney, width: 100),
                    _CellItem(text: data.note, width: 120),
                    _CellItem(text: data.status, width: 100),
                  ],
                ),
              );
            },
          ),)
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
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(bottom: 2.w),
      //padding: EdgeInsets.symmetric(vertical: 5.w),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 50,
                child: Text(id, style: PrimaryFont.bodyTextMedium())),
            SizedBox(
                width: 100,
                child: Text(category, style: PrimaryFont.bodyTextMedium())),
            SizedBox(
                width: 80,
                child: Text(cost, style: PrimaryFont.bodyTextMedium())),
            SizedBox(
                width: 80,
                child: Text(quantity, style: PrimaryFont.bodyTextMedium())),
            SizedBox(
                width: 100,
                child: Text(totalMoney, style: PrimaryFont.bodyTextMedium())),
            SizedBox(
                width: 120,
                child: Text(note, style: PrimaryFont.bodyTextMedium())),
            SizedBox(
                width: 100,
                child: Text(status, style: PrimaryFont.bodyTextMedium())),
          ],
        ),
      ),
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

class _ItemInforDetail extends StatelessWidget {
  const _ItemInforDetail({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.w,
      width: 100.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12.0,
          ),
          Text(
            title,
            style: PrimaryFont.bodyTextMedium(),
          ),
          Expanded(
            child: Text(
              subTitle,
              style: PrimaryFont.bodyTextBold(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
        ],
      ),
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
class _HeaderItem extends StatelessWidget {
  final String title;
  final double width;

  const _HeaderItem({required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(title, style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black)),
    );
  }
}

class _CellItem extends StatelessWidget {
  final String text;
  final double width;

  const _CellItem({required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(text, style: PrimaryFont.bodyTextMedium()),
    );
  }
}