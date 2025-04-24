import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mtac/common/input_cost_dialog.dart';
import 'package:mtac/models/schedule/cost_model.dart';
import 'package:mtac/models/schedule/merchandise_model.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:mtac/widgets/schedule_widget/sync_horizontal_table_widget.dart';
import 'package:sizer/sizer.dart';

class DetailScheduleCollectionScreen extends StatelessWidget {
  const DetailScheduleCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get data from other screen back
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
    //
    final List<String> imageList = arguments["image"] as List<String>? ?? [];
    //
    final List<dynamic> costListMap = arguments['costs'] ?? [];
    final List<CostModel> costList =
        costListMap.map((e) => CostModel.fromMap(e)).toList();
    //
    final List<dynamic> merchandiseListMap = arguments['merchandises'] ?? [];
    final List<MerchandiseModel> merchandiseList =
        merchandiseListMap.map((e) => MerchandiseModel.fromMap(e)).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Chi tiết lịch gom hôm nay",
                  style: PrimaryFont.headerTextBold(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 3.w),
                width: 100.w,
                //height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 5.w,
                    ),
                    _ItemInforDetail(
                      title: "Tên công ty: ",
                      icon: HugeIcons.strokeRoundedNewOffice,
                      subTitle: nameBusiness,
                    ),
                    _ItemInforDetail(
                      title: "Ngày & giờ thu gom: ",
                      icon: HugeIcons.strokeRoundedAppointment02,
                      subTitle: "$dayCollection • $timeCollection",
                    ),
                    _ItemInforDetail(
                      title: "Biển số xe: ",
                      icon: HugeIcons.strokeRoundedTruckDelivery,
                      subTitle: numberPlate,
                    ),
                    _ItemInforDetail(
                      title: "Loại hàng: ",
                      icon: HugeIcons.strokeRoundedPackageMoving,
                      subTitle: typeWaste,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 3.w,
                    ),
                    _ItemInforDetail(
                      title: "Ngày gửi lịch gom: ",
                      icon: HugeIcons.strokeRoundedCalendarCheckIn01,
                      subTitle: daySendCollection,
                    ),
                    _ItemInforDetail(
                      title: "Đơn giá vận chuyển: ",
                      icon: HugeIcons.strokeRoundedSaveMoneyDollar,
                      subTitle: costTransit,
                    ),
                    SizedBox(
                      height: 8.w,
                      width: 100.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20.0,
                          ),
                          Icon(
                            HugeIcons.strokeRoundedDocumentValidation,
                            size: 5.w,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Trạng thái công nợ: ",
                            style: PrimaryFont.bodyTextMedium(),
                          ),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                            child: Text(
                              debtStatus,
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
                    ),
                    const Divider(),
                    SizedBox(
                      height: 3.w,
                    ),
                    _ItemInforDetail(
                      title: "Thông tin người liên hệ: ",
                      icon: HugeIcons.strokeRoundedCallRinging04,
                      subTitle: contactPerson,
                    ),
                    const _ItemInforDetail(
                      title: "Số lượng nhân công: ",
                      icon: HugeIcons.strokeRoundedLabor,
                      subTitle: "Nguyễn Văn A, Lê Văn B Nguyễn Văn A",
                    ),
                    const Divider(),
                    SizedBox(
                      height: 3.w,
                    ),
                    _ItemInforDetail(
                      title: "Địa chỉ thu gom: ",
                      icon: HugeIcons.strokeRoundedLocation04,
                      subTitle: addressCollection,
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    _ItemInforDetail(
                      title: "Khu vực vận chuyển: ",
                      icon: HugeIcons.strokeRoundedSquareArrowRightDouble,
                      subTitle: areaTransit,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.w,
              ),
              Text(
                "Danh sách chi phí đi kèm",
                style: PrimaryFont.titleTextBold(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    InputCostDialog().showCostDialog(context);
                  },
                  child: Container(
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
                ),
              ),
              const Divider(),
              SizedBox(
                height: 5.w,
              ),
              IntrinsicHeight(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 41.h,
                  ),
                  child: costList.isNotEmpty
                      ? SyncHorizontalTableWidget(
                          headers: [
                            _HeaderItem(title: "ID", width: 15.w),
                            _HeaderItem(title: "HẠNG MỤC", width: 25.w),
                            _HeaderItem(title: "ĐƠN GIÁ", width: 20.w),
                            _HeaderItem(title: "THÀNH TIỀN", width: 20.w),
                            _HeaderItem(title: "SỐ LƯỢNG", width: 20.w),
                            _HeaderItem(title: "GHI CHÚ", width: 30.w),
                            _HeaderItem(title: "TRẠNG THÁI", width: 25.w),
                          ],
                          rows: costList.map((data) {
                            return [
                              _CellItem(text: '${data.id}', width: 15.w),
                              _CellItem(text: data.category, width: 25.w),
                              _CellItem(text: data.cost, width: 20.w),
                              _CellItem(text: data.totalMoney, width: 20.w),
                              _CellItem(text: data.quantity, width: 20.w),
                              _CellItem(text: data.note, width: 30.w),
                              _CellItem(text: data.status, width: 25.w),
                            ];
                          }).toList(),
                        )
                      : Center(
                        child: Text(
                            "Chưa có chi phí đi kèm nào !",
                            style: PrimaryFont.bodyTextMedium()
                                .copyWith(color: Colors.red),
                          ),
                      ),
                ),
              ),
              SizedBox(height: 5.w,),
              Text(
                "Danh sách hành hoá",
                style: PrimaryFont.titleTextBold(),
              ),
              const Divider(),
              SizedBox(
                height: 5.w,
              ),
              IntrinsicHeight(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 41.h),
                  child: merchandiseList.isNotEmpty ? SyncHorizontalTableWidget(
                    headers: [
                      _HeaderItem(title: "ID", width: 15.w),
                      _HeaderItem(title: "TÊN HÀNG HOÁ", width: 25.w),
                      _HeaderItem(title: "KL GOM - KG", width: 20.w),
                      _HeaderItem(title: "MÃ HÀNG HOÁ", width: 22.w),
                      _HeaderItem(title: "KHO NHẬP", width: 20.w),
                      _HeaderItem(title: "CHỦ XỬ LÝ", width: 30.w),
                    ],
                    rows: merchandiseList.map((data) {
                      return [
                        _CellItem(text: '${data.id}', width: 15.w),
                        _CellItem(text: data.nameGoods, width: 25.w),
                        _CellItem(text: data.totalWeight, width: 20.w),
                        _CellItem(text: data.idGoods, width: 22.w),
                        _CellItem(text: data.warehouse, width: 20.w),
                        _CellItem(text: data.processingOwner, width: 30.w),
                      ];
                    }).toList(),
                  ) : Center(
                    child: Text(
                            "Chưa có hàng hoá nào được thêm !",
                            style: PrimaryFont.bodyTextMedium()
                                .copyWith(color: Colors.red),
                               
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.w,
              ),
              imageList.isNotEmpty
                  ? Text(
                      "Hình ảnh thu gom",
                      style: PrimaryFont.titleTextBold(),
                    )
                  : const SizedBox(),
              imageList.isNotEmpty
                  ? SizedBox(
                      width: 100.w,
                      height: 30.w,
                      child: CustomScrollView(
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (contex, index) {
                                return Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: Image.network(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              childCount: imageList.length,
                            ),
                          ),
                        ],
                      ),
                    )
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

class _ItemInforDetail extends StatelessWidget {
  const _ItemInforDetail({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.w,
      width: 100.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Icon(
            icon,
            size: 5.w,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10.0,
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

class _HeaderItem extends StatelessWidget {
  final String title;
  final double width;

  const _HeaderItem({required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      width: width,
      child: Text(
        title,
        style: PrimaryFont.bodyTextBold().copyWith(color: Colors.black),
      ),
    );
  }
}

class _CellItem extends StatelessWidget {
  final String text;
  final double width;

  const _CellItem({required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      width: width,
      child: Text(
        text,
        style: PrimaryFont.bodyTextMedium(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
