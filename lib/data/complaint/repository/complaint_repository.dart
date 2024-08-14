import 'dart:io';

import 'package:app/core/response/json_response.dart';
import 'package:app/data/complaint/network/complaint_network.dart';
import 'package:app/data/complaint/network/dto_get_complaint_response.dart';

class ComplaintRepository {
  final ComplaintNetwork _complaintNetwork;

  ComplaintRepository(this._complaintNetwork);

  Future<JsonResponse<GetComplaintResponse>> getAllComplaints() async =>
      await _complaintNetwork.getAllComplaints();

  Future<JsonResponse<GetComplaintResponse>> getComplaintById(int id) async =>
      await _complaintNetwork.getComplaintById(id);

  Future<JsonResponse<GetComplaintResponse>> getComplaintByStatus(
          String status) async =>
      await _complaintNetwork.getComplaintByStatus(status);

  Future<JsonResponse<GetComplaintResponse>> createComplaint({
    required String homeAddress,
    required String description,
    required File complaintAsset,
  }) async =>
      await _complaintNetwork.createComplaint(
        homeAddress: homeAddress,
        description: description,
        complaintAsset: complaintAsset,
      );

  Future<JsonResponse<GetComplaintResponse>> updateComplaint({
    required int id,
    required String sparepart,
    required String handlingDescription,
    required File handlingAsset,
  }) async =>
      await _complaintNetwork.updateComplaint(
        sparepart: sparepart,
        handlingDescription: handlingDescription,
        handlingAsset: handlingAsset,
        id: id,
        status: 'done',
      );

  Future<JsonResponse<GetComplaintResponse>> acceptComplaint(int id, String status) async =>
      await _complaintNetwork.acceptComplaint(id, status);
}
