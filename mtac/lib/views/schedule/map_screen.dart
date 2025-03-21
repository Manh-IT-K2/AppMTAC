import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/controllers/map_controller.dart';
import 'package:mtac/routes/app_routes.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final MapController controller = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = 100.h;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: GetBuilder<MapController>(
              builder: (controller) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: controller.startLocation,
                    zoom: 14,
                  ),
                  markers: controller.markers,
                  polylines: controller.polylines,
                  // myLocationEnabled: true,
                  onMapCreated: (GoogleMapController mapController) {
                    controller.setMapController(mapController);
                  },
                );
              },
            ),
          ),
          Positioned(
            top: 15.w,
            left: 5.w,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: const Offset(1, 1))
                    ]),
                child: Transform.translate(
                  offset: const Offset(4, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 5.w,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (controller.isRouteSelected.value) {
              return Positioned(
                bottom: 80,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => controller.isRouteSelected.value = false,
                          child: Icon(
                            Icons.close,
                            size: 4.w,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Text(
                        controller.selectedAddress.value,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: controller.openGoogleMaps,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor.withOpacity(0.6), 
                          foregroundColor: Colors.white, 
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.w), 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.w),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Đi đến vị trí",
                          style: PrimaryFont.bodyTextBold(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),

          // Draggable Bottom Sheet
          Obx(
            () => Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  controller.updateHeight(details.primaryDelta!, screenHeight);
                },
                child: Container(
                  height: screenHeight * controller.sheetHeight.value,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 35.w,
                        height: 1.w,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Text(
                                txtTitleBottomM,
                                style: PrimaryFont.headerTextBold().copyWith(
                                  color: const Color(0xFF233751),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Container(
                                        width: 3.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                      ),
                                      Container(
                                        width: 0.5.w,
                                        height: 50.w,
                                        color: kPrimaryColor,
                                      ),
                                      Container(
                                        width: 3.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                      ),
                                      Container(
                                        width: 0.5.w,
                                        height: 50.w,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        width: 3.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5.w),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const _ItemDestination(),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: kPrimaryColor,
                                          size: 5.w,
                                        ),
                                        const _ItemDestination(),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: kPrimaryColor,
                                          size: 5.w,
                                        ),
                                        const _ItemDestination(),
                                        SizedBox(
                                          height: 10.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDestination extends StatelessWidget {
  const _ItemDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.w),
        Text(
          "Công ty CP SX TM Sáng Việt",
          style: PrimaryFont.titleTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "+BD: 0",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "+CC: 588.5",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "GOM: L1/11",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          "Gom đủ khối lượng không phát sinh",
          style: PrimaryFont.bodyTextMedium().copyWith(
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Chị Giao",
              style: PrimaryFont.bodyTextBold().copyWith(
                color: Colors.black,
              ),
            ),
            Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 4.w,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.edit_square,
              color: const Color(0xFF997FEC),
              size: 5.w,
            ),
            SizedBox(
              width: 2.w,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.HANDOVERRECORD);
              },
              child: Text(
                txtWriteRecordM,
                style: PrimaryFont.bodyTextBold().copyWith(
                  color: const Color(0xFF997FEC),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
