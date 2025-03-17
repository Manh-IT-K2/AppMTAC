import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/constants/text.dart';
import 'package:mtac/controllers/handover_record_controller.dart';
import 'package:mtac/utils/theme_text.dart';

class BottomImageSourceSheet extends StatelessWidget {
  const BottomImageSourceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final imageController = Get.find<HandoverRecordController>();

    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.image),
          title: Text(txtLibrary,
              style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black)),
          onTap: () {
            imageController.pickMultipleImages();
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: Text(
            txtCamera,
            style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
          ),
          onTap: () {
            imageController.pickImageFromCamera();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
