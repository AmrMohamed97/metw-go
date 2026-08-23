import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class DelegateInfoState {}

class DelegateInfoInitialState extends DelegateInfoState {}

class ChangeDelegateTypeSuccess extends DelegateInfoState {}

class ChangeWorkClassificationSuccess extends DelegateInfoState {}

class GetWarehousesLoading extends DelegateInfoState {}

class GetWarehousesSuccess extends DelegateInfoState {}

class GetWarehousesFailure extends DelegateInfoState {
  final String message;
  GetWarehousesFailure(this.message);
}

class UpdateWorkInfoLoading extends DelegateInfoState {}

class UpdateWorkInfoSuccess extends DelegateInfoState {
  final ProfileOutModel profileOutModel;
  UpdateWorkInfoSuccess(this.profileOutModel);
}

class UpdateWorkInfoFailure extends DelegateInfoState {
  final String message;
  UpdateWorkInfoFailure(this.message);
}
