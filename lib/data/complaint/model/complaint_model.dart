import 'package:app/data/complaint/network/dto_get_complaint_response.dart';

class ComplaintModel {
  final int id;
  final String userId;
  final String homeAddress;
  final String description;
  final String handlingAsset;
  final String complaintAsset;
  final String sparepart;
  final String handlingDescription;
  final String status;
  final String userHandlerId;
  final String createdAt;
  final String updatedAt;
  final String? technicianName;

  ComplaintModel({
    required this.id,
    required this.userId,
    required this.homeAddress,
    required this.description,
    required this.handlingAsset,
    required this.complaintAsset,
    required this.sparepart,
    required this.handlingDescription,
    required this.status,
    required this.userHandlerId,
    required this.createdAt,
    required this.updatedAt,
    this.technicianName,
  });

  factory ComplaintModel.fromResponse(GetComplaintResponse response) {
    return ComplaintModel(
      id: response.id ?? -1,
      userId: response.userId ?? '',
      homeAddress: response.homeAddress ?? '',
      description: response.description ?? '',
      handlingAsset: response.handlingAsset ?? '',
      complaintAsset: response.complaintAsset ?? '',
      sparepart: response.sparepart ?? '',
      handlingDescription: response.handlingDescription ?? '',
      status: response.status ?? '',
      userHandlerId: response.userHandlerId ?? '',
      createdAt: response.createdAt ?? '',
      updatedAt: response.updatedAt ?? '',
      technicianName: response.technicianName ?? '',
    );
  }
}
