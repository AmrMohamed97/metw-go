import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/notification/data/models/notification_response.dart';
import 'package:metw_go/features/notification/data/repo/notification_repo.dart';
import 'package:metw_go/features/notification/presentation/manager/notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;

  NotificationCubit(this.repo) : super(NotificationInitialState());

  NotificationResponse? notificationsData;

  void init() {
    getNotifications();
  }

  Future<void> getNotifications({int page = 1, int limit = 10}) async {
    emit(NotificationLoadingState());
    final result = await repo.getNotifications(page: page, limit: limit);

    result.fold(
      (failure) => emit(NotificationFailureState(failure.message)),
      (response) {
        notificationsData = response;
        emit(NotificationSuccessState(response));
      },
    );
  }
}
