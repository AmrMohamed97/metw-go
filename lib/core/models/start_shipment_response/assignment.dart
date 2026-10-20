import 'package:json_annotation/json_annotation.dart';

part 'assignment.g.dart';

@JsonSerializable()
class Assignment {
	num? id;
	@JsonKey(name: 'request_path_id') 
	num? requestPathId;
	@JsonKey(name: 'leg_type') 
	String? legType;
	@JsonKey(name: 'leg_label') 
	String? legLabel;
	@JsonKey(name: 'representative_id') 
	num? representativeId;
	@JsonKey(name: 'warehouse_id') 
	dynamic warehouseId;
	@JsonKey(name: 'party_type') 
	String? partyType;
	@JsonKey(name: 'representative_name') 
	String? representativeName;
	@JsonKey(name: 'warehouse_name') 
	dynamic warehouseName;
	String? status;
	@JsonKey(name: 'status_label') 
	String? statusLabel;
	@JsonKey(name: 'fee_mode') 
	String? feeMode;
	@JsonKey(name: 'fee_source') 
	String? feeSource;
	@JsonKey(name: 'offered_fee') 
	dynamic offeredFee;
	@JsonKey(name: 'accepted_fee') 
	num? acceptedFee;
	@JsonKey(name: 'requires_fee_input') 
	bool? requiresFeeInput;
	String? currency;
	@JsonKey(name: 'offered_at') 
	DateTime? offeredAt;
	@JsonKey(name: 'responded_at') 
	DateTime? respondedAt;
	@JsonKey(name: 'response_deadline_at') 
	DateTime? responseDeadlineAt;
	@JsonKey(name: 'window_opens_at') 
	DateTime? windowOpensAt;
	@JsonKey(name: 'window_closes_at') 
	DateTime? windowClosesAt;
	@JsonKey(name: 'rejection_note') 
	dynamic rejectionNote;

	Assignment({
		this.id, 
		this.requestPathId, 
		this.legType, 
		this.legLabel, 
		this.representativeId, 
		this.warehouseId, 
		this.partyType, 
		this.representativeName, 
		this.warehouseName, 
		this.status, 
		this.statusLabel, 
		this.feeMode, 
		this.feeSource, 
		this.offeredFee, 
		this.acceptedFee, 
		this.requiresFeeInput, 
		this.currency, 
		this.offeredAt, 
		this.respondedAt, 
		this.responseDeadlineAt, 
		this.windowOpensAt, 
		this.windowClosesAt, 
		this.rejectionNote, 
	});

	factory Assignment.fromJson(Map<String, dynamic> json) {
		return _$AssignmentFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}
