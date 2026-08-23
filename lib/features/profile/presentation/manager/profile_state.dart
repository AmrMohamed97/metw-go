import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileError extends ProfileState {
  final String message;
  GetProfileError(this.message);
}

class GetProfileSuccess extends ProfileState {
  final ProfileOutModel profileOutModel;
  GetProfileSuccess(this.profileOutModel);
}

class ToggleNotificationsState extends ProfileState {
  final bool notificationsEnabled;
  ToggleNotificationsState(this.notificationsEnabled);
}
