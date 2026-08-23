import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class VehicleState {}

class VehicleInitialState extends VehicleState {}

class PickVehicleImageSuccess extends VehicleState {}

class PickVehicleImageLoading extends VehicleState {}

class ChangeTransportTypeSuccess extends VehicleState {}

class GetTransportTypesLoading extends VehicleState {}

class GetTransportTypesSuccess extends VehicleState {}

class GetTransportTypesFailure extends VehicleState {
  final String message;
  GetTransportTypesFailure(this.message);
}

class UpdateTransportLoading extends VehicleState {}

class UpdateTransportSuccess extends VehicleState {
  final ProfileOutModel profileOutModel;
  UpdateTransportSuccess(this.profileOutModel);
}

class UpdateTransportFailure extends VehicleState {
  final String message;
  UpdateTransportFailure(this.message);
}
