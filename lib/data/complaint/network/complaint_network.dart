import 'dart:io';

import 'package:app/core/network/base_network.dart';
import 'package:app/core/response/api_response.dart';
import 'package:app/core/response/json_response.dart';
import 'package:app/data/complaint/network/dto_get_complaint_response.dart';

class ComplaintNetwork {
  final _network = BaseNetwork.instance;

  static const _getAllComplaints = 'api/complaint/get';
  static const _getComplaintById = 'api/complaint/{id}';
  static const _getComplaintByStatus = 'api/complaint/officer';
  static const _createComplaint = 'api/submit-complaint';

  Future<JsonResponse<GetComplaintResponse>> getAllComplaints() async {
    final response = await _network.get(_getAllComplaints,
        options: await _network.baseOption);

    return ApiResponse.json(response, GetComplaintResponse.fromJson);
  }

  Future<JsonResponse<GetComplaintResponse>> getComplaintById(int id) async {
    final response = await _network.get(
        _getComplaintById.replaceAll('{id}', id.toString()),
        options: await _network.baseOption);

    return ApiResponse.json(response, GetComplaintResponse.fromJson);
  }

  Future<JsonResponse<GetComplaintResponse>> getComplaintByStatus(
      String status) async {
    final response = await _network.get('$_getComplaintByStatus/$status',
        options: await _network.baseOption);

    return ApiResponse.json(response, GetComplaintResponse.fromJson);
  }

  Future<JsonResponse<GetComplaintResponse>> createComplaint({
    required String homeAddress,
    required String description,
    required File complaintAsset,
  }) async {
    final response = await _network.post(_createComplaint,
        body: {
          'home_address': homeAddress,
          'description': description,
        },
        files: [
          FileModel(
            requestName: 'complaint_asset',
            files: [
              complaintAsset.path,
            ],
          ),
        ],
        options: await _network.baseOption);

    return ApiResponse.json(response, GetComplaintResponse.fromJson);
  }

  Future<JsonResponse<GetComplaintResponse>> updateComplaint({
    required int id,
    String? sparepart,
    String? handlingDescription,
    File? handlingAsset,
    String? status,
  }) async {
    final response = await _network.post('$_createComplaint/$id',
        body: {
          'sparepart': sparepart,
          'handling_description': handlingDescription,
          'status': status,
        },
        files: [
          FileModel(
            requestName: 'handling_asset',
            files: [
              handlingAsset!.path,
            ],
          ),
        ],
        options: await _network.baseOption);

    return ApiResponse.json(response, GetComplaintResponse.fromJson);
  }
}
