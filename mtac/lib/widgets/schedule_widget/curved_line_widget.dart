import 'package:flutter/material.dart';

class CurvedLineWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height); // bắt đầu từ trái, đáy
    path.quadraticBezierTo(
      0, size.width / 2, // điểm cong lên ở giữa
      size.width, size.height, // kết thúc bên phải, đáy
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
