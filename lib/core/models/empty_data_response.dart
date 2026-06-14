import 'package:flutter/foundation.dart';

@immutable
class EmptyDataResponse {
  final bool? status;
  final String? message;

  const EmptyDataResponse({this.status, this.message});

  @override
  String toString() {
    return 'EmptyDataResponse(status: $status, message: $message)';
  }

  factory EmptyDataResponse.fromJson(Map<String, dynamic> json) {
    return EmptyDataResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'message': message};

  EmptyDataResponse copyWith({bool? status, String? message}) {
    return EmptyDataResponse(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
