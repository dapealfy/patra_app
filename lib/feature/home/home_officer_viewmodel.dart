import 'dart:convert';

import 'package:app/core/di/service_locator.dart';
import 'package:app/data/complaint/model/complaint_model.dart';
import 'package:app/data/complaint/network/dto_get_complaint_response.dart';
import 'package:app/data/complaint/repository/complaint_repository.dart';
import 'package:flutter/foundation.dart';

class HomeOfficerViewmodel extends ChangeNotifier {
  late final ComplaintRepository _complaintRepository = serviceLocator.get();
  List<ComplaintModel> onGoingComplaints = [];
  List<ComplaintModel> receiveComplaints = [];
  List<ComplaintModel> allComplaints = [];

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

  Future<void> getOnGoingComplaints() async {
    try {
      final response =
          await _complaintRepository.getComplaintByStatus('onGoing');
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

  Future<void> getReceiveComplaints() async {
    try {
      final response =
          await _complaintRepository.getComplaintByStatus('receive');
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
}
