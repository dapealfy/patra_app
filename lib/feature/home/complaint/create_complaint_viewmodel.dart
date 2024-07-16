import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateComplaintViewmodel extends ChangeNotifier {
  TextEditingController nomorRumahController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  File? complaintImage;

  void selectComplaintImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      complaintImage = File(image.path);
      notifyListeners();
    }
  }

  void submitComplaint() {
    //TODO: Submit Complaint
  }
}
