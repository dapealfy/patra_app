import 'dart:convert';

import 'package:app/core/di/service_locator.dart';
import 'package:app/data/complaint/model/complaint_model.dart';
import 'package:app/data/complaint/network/dto_get_complaint_response.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';
import 'package:flutter/foundation.dart';

class HomeCustomerViewmodel extends ChangeNotifier {
  late final ComplaintRepository _complaintRepository = serviceLocator.get();
  List<ComplaintModel> allComplaints = [];
  ComplaintModel? selectedComplaint;

  Future<void> getAllComplaints() async {
    try {
      final response = await _complaintRepository.getAllComplaints();
      if (response.statCode == 200) {
        allComplaints = List<ComplaintModel>.from(
          jsonDecode(response.body)['data']
              .map((e) => GetComplaintResponse.fromJson(e))
              .map((e) => ComplaintModel.fromResponse(e)),
        );
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getComplaintByStatus(String status) async {
    final response = await _complaintRepository.getComplaintByStatus(status);
    if (response.statCode == 200) {
      final complaint =
          GetComplaintResponse.fromJson(jsonDecode(response.body));
      selectedComplaint = ComplaintModel.fromResponse(complaint);
      notifyListeners();
    }
  }
}
