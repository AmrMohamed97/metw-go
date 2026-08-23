import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class PersonalInfoState {}

class PersonalInfoInitialState extends PersonalInfoState {}

class ChangeOpsecureState extends PersonalInfoState {}

class ChangeGenderSuccess extends PersonalInfoState {}

class UpdatePersonalInfoLoading extends PersonalInfoState {}

class UpdatePersonalInfoSuccess extends PersonalInfoState {
  final ProfileOutModel profileOutModel;
  UpdatePersonalInfoSuccess(this.profileOutModel);
}

class UpdatePersonalInfoFailure extends PersonalInfoState {
  final String message;
  UpdatePersonalInfoFailure(this.message);
}
