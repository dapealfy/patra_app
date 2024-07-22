import 'dart:io';

import 'package:app/core/di/service_locator.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateComplaintViewmodel extends ChangeNotifier {
  late final ComplaintRepository _complaintRepository =
      serviceLocator<ComplaintRepository>();
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
    if (complaintImage != null) {
      // _complaintRepository
      //     .updateComplaint(
      //       homeAddress: nomorRumahController.text,
      //       description: keteranganController.text,
      //       complaintAsset: complaintImage!,
      //     )
      //     .then((value) => notifyListeners());
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada gambar yang dipilih'),
        ),
      );
    }
  }
}
