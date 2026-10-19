import 'package:json_annotation/json_annotation.dart';

/// حالة الشحنة كلها: data.request_status
enum ShipmentRequestStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('submitted')
  submitted,
  @JsonValue('matching')
  matching,
  @JsonValue('awaiting_path_selection')
  awaitingPathSelection,
  @JsonValue('awaiting_advance')
  awaitingAdvance,
  @JsonValue('executing')
  executing,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('rejected')
  rejected,
  @JsonValue('failed_unavailable')
  failedUnavailable,
}

/// حالة المسار: data.path.status
enum ShipmentPathStatus {
  @JsonValue('matching')
  matching,
  @JsonValue('courier_confirmed')
  courierConfirmed,
  @JsonValue('submitted_to_client')
  submittedToClient,
  @JsonValue('client_selected')
  clientSelected,
  @JsonValue('executing')
  executing,
  @JsonValue('executed')
  executed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

/// حالة عرض المندوب: data.status
enum ShipmentAssignmentStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('reserve')
  reserve,
  @JsonValue('executing')
  executing,
  @JsonValue('completed')
  completed,
  @JsonValue('rejected')
  rejected,
  @JsonValue('expired')
  expired,
  @JsonValue('cancelled')
  cancelled,
}

/// حالة خطوة التسليم: data.lifecycle.current_handoff.status
enum HandoffStatus {
  @JsonValue('locked')
  locked,
  @JsonValue('awaiting_receiver')
  awaitingReceiver,
  @JsonValue('awaiting_sender')
  awaitingSender,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}
