import 'dart:convert';
import 'dart:io';

import 'package:app/core/di/service_locator.dart';
import 'package:app/data/complaint/model/complaint_model.dart';
import 'package:app/data/complaint/network/dto_get_complaint_response.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class UpdateComplaintViewmodel extends ChangeNotifier {
  late final ComplaintRepository _complaintRepository =
      serviceLocator<ComplaintRepository>();
  TextEditingController sparepartController = TextEditingController();
  TextEditingController laporanPengerjaanController = TextEditingController();
  File? handlingImage;

  ComplaintModel? selectedComplaint;

  Future<void> getComplaint(int id) async {
    final response = await _complaintRepository.getComplaintById(id);
    if (response.statCode == 200) {
      final complaint =
          GetComplaintResponse.fromJson(jsonDecode(response.body)['data']);
      selectedComplaint = ComplaintModel.fromResponse(complaint);
      notifyListeners();
    }
  }

  void selectHandlingImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      handlingImage = File(image.path);
      notifyListeners();
    }
  }

  void submitComplaint() {
    if (handlingImage != null) {
      _complaintRepository
          .updateComplaint(
        sparepart: sparepartController.text,
        handlingDescription: laporanPengerjaanController.text,
        handlingAsset: handlingImage!,
        id: selectedComplaint!.id,
      )
          .then((value) {
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
