import 'dart:typed_data';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hugeicons/hugeicons.dart';

class MapController extends GetxController {
  /* Bottom bar Destination */
  var sheetHeight = 0.07.obs;

  void updateHeight(double delta, double screenHeight) {
    sheetHeight.value -= delta / screenHeight;
    sheetHeight.value = sheetHeight.value.clamp(0.07, 0.7);
  }

  /* Google Map */
  GoogleMapController? mapController;

  // Toạ độ điểm bắt đầu & kết thúc
  final LatLng startLocation = const LatLng(10.7769, 106.7009); // Bến Thành
  final LatLng endLocation = const LatLng(10.8039, 106.7143); // Bình Thạnh

// Danh sách các điểm của tuyến đường
  final List<LatLng> routePoints = const [
    LatLng(10.7769, 106.7009), // Bến Thành
    LatLng(10.7845, 106.7070), // Nguyễn Thị Minh Khai
    LatLng(10.7932, 106.7112), // Điện Biên Phủ
    LatLng(10.8039, 106.7143), // Bình Thạnh
  ];

  // Danh sách Marker
  RxSet<Marker> markers = <Marker>{}.obs;

  // Danh sách tuyến đường (Polyline)
  RxSet<Polyline> polylines = <Polyline>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMapData();
  }

  void _loadMapData() async {
    final markerIcon1 = await createCustomMarker(
      icon: HugeIcons.strokeRoundedPackage03,
      backgroundColor: Colors.blue,
      borderColor: Colors.white,
    );

    final markerIcon2 = await createCustomMarker(
      icon: Icons.location_on_outlined,
      backgroundColor: const Color(0xFFF9C805),
      borderColor: Colors.white,
    );

    // Thêm Marker
    markers.addAll({
      Marker(
        markerId: const MarkerId("start"),
        position: startLocation,
        icon: markerIcon2,
      ),
      Marker(
        markerId: const MarkerId("end"),
        position: endLocation,
        icon: markerIcon1,
      ),
      for (int i = 1; i < routePoints.length - 1; i++)
        Marker(
          markerId: MarkerId("point$i"),
          position: routePoints[i],
          icon: markerIcon2,
        ),
    });

    // Thêm tuyến đường (Polyline)
    polylines.add(
      Polyline(
        polylineId: const PolylineId("route"),
        color: Colors.green,
        width: 5,
        points: routePoints,
      ),
    );
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
    update();
  }

  // Draw Icon Map
  Future<BitmapDescriptor> createCustomMarker({
    required IconData icon,
    Color backgroundColor = Colors.amber,
    Color borderColor = Colors.white,
  }) async {
    const double size = 125; // Kích thước tổng của marker
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // 🎨 **Tạo màu vẽ**
    final Paint paintBorder = Paint()..color = borderColor; // Viền
    final Paint paintCircle = Paint()..color = backgroundColor; // Nền
    final Paint paintLine = Paint()
      ..color = Colors.black
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final Paint paintDot = Paint()..color = Colors.black; // Chấm tròn đen

    final double circleRadius = size / 3; // Bán kính hình tròn

    // 📌 **1. Vẽ đường kẻ đen dài hơn**
    final double lineStartY = size - 10;
    final double lineEndY = size - 100;
    canvas.drawLine(
      Offset(size / 2, lineStartY),
      Offset(size / 2, lineEndY),
      paintLine,
    );

    // 📌 **2. Dịch chấm tròn đen xuống dưới**
    final double dotRadius = 6;
    canvas.drawCircle(
      Offset(size / 2, lineStartY + 5),
      dotRadius,
      paintDot,
    );

    // 📌 **3. Vẽ viền trắng**
    canvas.drawCircle(
      const Offset(size / 2, size - 80),
      circleRadius + 5,
      paintBorder,
    );

    // 📌 **4. Vẽ nền màu vàng (có thể thay đổi)**
    canvas.drawCircle(
      const Offset(size / 2, size - 80),
      circleRadius,
      paintCircle,
    );

    // 📌 **5. Vẽ icon vị trí màu trắng**
    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: circleRadius * 1.2,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: Colors.white,
        ),
      );

    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size / 2 - textPainter.width / 2,
            size - 80 - textPainter.height / 2));

    // 🖼 **Chuyển hình thành BitmapDescriptor để dùng trong Google Maps**
    final img = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final ByteData? byteData =
        await img.toByteData(format: ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }
}
