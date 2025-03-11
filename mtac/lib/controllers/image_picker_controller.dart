import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var selectedImages = <File>[].obs;
  var checkDistance = false.obs;

 // selected library
  Future<void> pickMultipleImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      List<File> newImages = images.map((img) => File(img.path)).toList();
      // filter image name
      final Set<String> fileNames =
          selectedImages.map((file) => file.path.split('/').last).toSet();
      for (var img in newImages) {
        if (!fileNames.contains(img.path.split('/').last)) {
          selectedImages.add(img);
        }
      }
      checkDistance.value = selectedImages.isNotEmpty;
      //selectedImages.refresh();
      //print("Selected Images: ${selectedImages.map((e) => e.path).toList()}");
    }
  }

  // Camera
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImages.add(File(image.path));
      checkDistance.value = selectedImages.isNotEmpty;
      //selectedImages.refresh();
    }
  }
}
