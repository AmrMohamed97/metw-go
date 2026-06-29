import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/notifications/notification_handler.dart';
import 'package:metw_go/features/profile/presentation/manager/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  bool get notificationsEnabled => NotificationHandler.notificationsEnabled;

  Future<void> toggleNotifications(bool value) async {
    if (value) {
      await NotificationHandler.enableNotifications();
    } else {
      await NotificationHandler.disableNotifications();
    }
    emit(ToggleNotificationsState(NotificationHandler.notificationsEnabled));
  }
}
