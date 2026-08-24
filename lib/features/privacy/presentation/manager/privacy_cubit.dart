import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/privacy/data/models/privacy_response.dart';
import 'package:metw_go/features/privacy/data/repo/privacy_repo.dart';
import 'package:metw_go/features/privacy/presentation/manager/privacy_state.dart';

@injectable
class PrivacyCubit extends Cubit<PrivacyState> {
  final PrivacyRepo repo;

  PrivacyCubit(this.repo) : super(PrivacyInitialState());

  PrivacyDataModel? privacyData;

  void init() {
    getPrivacy();
  }

  Future<void> getPrivacy() async {
    emit(PrivacyLoadingState());
    final result = await repo.getPrivacy();

    result.fold(
      (failure) => emit(PrivacyFailureState(failure.message)),
      (response) {
        privacyData = response.data;
        emit(PrivacySuccessState(privacyData ?? PrivacyDataModel()));
      },
    );
  }
}
