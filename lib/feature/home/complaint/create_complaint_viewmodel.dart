import 'dart:io';

import 'package:app/core/di/service_locator.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CreateComplaintViewmodel extends ChangeNotifier {
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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void submitComplaint() {
    if (complaintImage != null) {
      isLoading = true;
      _complaintRepository
          .createComplaint(
            homeAddress: nomorRumahController.text,
            description: keteranganController.text,
            complaintAsset: complaintImage!,
          )
          .then((value) {
            isLoading = false;
            notifyListeners();
            navigatorKey.currentContext!.pop();
          });
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada gambar yang dipilih'),
        ),
      );
    }
  }
}
