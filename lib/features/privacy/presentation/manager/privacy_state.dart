import 'package:metw_go/features/privacy/data/models/privacy_response.dart';

abstract class PrivacyState {}

class PrivacyInitialState extends PrivacyState {}

class PrivacyLoadingState extends PrivacyState {}

class PrivacySuccessState extends PrivacyState {
  final PrivacyDataModel privacyData;

  PrivacySuccessState(this.privacyData);
}

class PrivacyFailureState extends PrivacyState {
  final String message;

  PrivacyFailureState(this.message);
}
