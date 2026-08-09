import 'package:metw_go/features/register/data/models/register_out_model/register_out_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

// class ChangePageSuccess extends RegisterState {}

class ChangeGenderSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}

class RegisterSuccess extends RegisterState {
  final RegisterOutModel registerOutModel;

  RegisterSuccess(this.registerOutModel);
}
// class PickVehicleImageLoading extends RegisterState {}

// class ChangeRuralServiceState extends RegisterState {}

// class RemoveGovernorateState extends RegisterState {}

// class RemoveCityState extends RegisterState {}

// class PickDocumentImageSuccess extends RegisterState {}

// class PickDocumentImageLoading extends RegisterState {}
