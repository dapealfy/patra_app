import 'package:app/core/type_defs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_get_complaint_response.g.dart';

@JsonSerializable()
class GetComplaintResponse {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'home_address')
  final String? homeAddress;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'handling_asset')
  final String? handlingAsset;
  @JsonKey(name: 'complaint_asset')
  final String? complaintAsset;
  @JsonKey(name: 'sparepart')
  final String? sparepart;
  @JsonKey(name: 'handling_description')
  final String? handlingDescription;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'user_handler_id')
  final String? userHandlerId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  GetComplaintResponse({
    this.id,
    this.userId,
    this.homeAddress,
    this.description,
    this.handlingAsset,
    this.complaintAsset,
    this.sparepart,
    this.handlingDescription,
    this.status,
    this.userHandlerId,
    this.createdAt,
    this.updatedAt,
  });

  factory GetComplaintResponse.fromJson(Json json) => _$GetComplaintResponseFromJson(json);

  Json toJson() => _$GetComplaintResponseToJson(this);
}
