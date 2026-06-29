abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ToggleNotificationsState extends ProfileState {
  final bool notificationsEnabled;
  ToggleNotificationsState(this.notificationsEnabled);
}
