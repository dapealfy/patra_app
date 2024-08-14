import 'dart:convert';

import 'package:app/core/di/service_locator.dart';
import 'package:app/data/complaint/model/complaint_model.dart';
import 'package:app/data/complaint/network/dto_get_complaint_response.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailComplaintViewmodel extends ChangeNotifier {
  final _complaintRepository = serviceLocator.get<ComplaintRepository>();

  ComplaintModel? selectedComplaint;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getComplaint(int id) async {
    final response = await _complaintRepository.getComplaintById(id);
    if (response.statCode == 200) {
      final complaint =
          GetComplaintResponse.fromJson(jsonDecode(response.body)['data']);
      selectedComplaint = ComplaintModel.fromResponse(complaint);
      notifyListeners();
    }
  }

  void acceptComplaint(String status) {
    isLoading = true;
    notifyListeners();
    _complaintRepository
        .acceptComplaint(selectedComplaint!.id, status)
        .then((value) {
      isLoading = false;
      notifyListeners();
      navigatorKey.currentContext!.pop();
    });
  }
}
