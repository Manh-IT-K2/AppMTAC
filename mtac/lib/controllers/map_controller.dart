import 'dart:typed_data';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
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
  Rx<LatLng?> currentLocation = Rx<LatLng?>(null);

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
    getCurrentLocation();
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

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kiểm tra dịch vụ vị trí
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Kiểm tra quyền truy cập
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Lấy vị trí hiện tại
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation.value = LatLng(position.latitude, position.longitude);
final customIcon = await createCurrentLocationMarker();
    // Thêm Marker vị trí hiện tại
    markers.add(
      Marker(
        markerId: const MarkerId("currentLocation"),
        position: currentLocation.value!,
        icon: customIcon,
      ),
    );

    // Cập nhật Camera đến vị trí hiện tại
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(currentLocation.value!, 15),
      );
    }
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

  Future<BitmapDescriptor> createCurrentLocationMarker() async {
  const double size = 120; // Kích thước tổng của marker
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);

  // 🎨 **Tạo màu vẽ**
  final Paint paintBorder = Paint()..color = Colors.purple.shade100; // Viền xanh mờ
  final Paint paintCircle = Paint()..color = Colors.purple.shade700; // Nền xanh đậm
  final Paint paintInnerCircle = Paint()..color = Colors.white; // Vòng tròn trong
  final Paint paintArrow = Paint()..color = Colors.purple.shade900; // Mũi tên

  final double outerCircleRadius = size / 2; // Bán kính hình tròn lớn
  final double innerCircleRadius = outerCircleRadius * 0.8; // Hình tròn nhỏ

  // 📌 **1. Vẽ viền xanh mờ**
  canvas.drawCircle(
    Offset(outerCircleRadius, outerCircleRadius),
    outerCircleRadius,
    paintBorder,
  );

  // 📌 **2. Vẽ nền xanh đậm**
  canvas.drawCircle(
    Offset(outerCircleRadius, outerCircleRadius),
    innerCircleRadius,
    paintCircle,
  );

  // 📌 **3. Vẽ vòng tròn trắng bên trong**
  canvas.drawCircle(
    Offset(outerCircleRadius, outerCircleRadius),
    innerCircleRadius * 0.8,
    paintInnerCircle,
  );

  // 📌 **4. Vẽ mũi tên định hướng**
 Path arrowPath = Path()
  ..moveTo(outerCircleRadius, outerCircleRadius - 30) // Đỉnh mũi tên xa hơn
  ..lineTo(outerCircleRadius - 20, outerCircleRadius + 15) // Cánh mũi tên rộng hơn
  ..lineTo(outerCircleRadius, outerCircleRadius) // Gốc mũi tên thấp hơn
  ..lineTo(outerCircleRadius + 20, outerCircleRadius + 15) // Cánh còn lại rộng hơn
  ..close();


  canvas.drawPath(arrowPath, paintArrow);

  // 🖼 **Chuyển hình thành BitmapDescriptor**
  final img = await pictureRecorder.endRecording().toImage(size.toInt(), size.toInt());
  final ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
  final Uint8List uint8List = byteData!.buffer.asUint8List();

  return BitmapDescriptor.fromBytes(uint8List);
}

}
