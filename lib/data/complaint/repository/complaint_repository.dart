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
}
