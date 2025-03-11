import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtac/controllers/image_picker_controller.dart';


class BottomPreviewImageSheet extends StatelessWidget {
  const BottomPreviewImageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Get.find<ImagePickerController>();

    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Obx(() {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: imageController.selectedImages.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                imageController.selectedImages[index],
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }),
    );
  }
}
