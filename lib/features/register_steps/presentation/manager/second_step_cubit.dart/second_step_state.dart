abstract class SecondStepState {}

class SecondStepInitial extends SecondStepState {}

class PickVehicleImageLoading extends SecondStepState {}

class PickVehicleImageSuccess extends SecondStepState {}

class GetTransportTypesLoading extends SecondStepState {}

class GetTransportTypesSuccess extends SecondStepState {}

class GetTransportTypesFailure extends SecondStepState {
  final String message;
  GetTransportTypesFailure(this.message);
}

class ChangeTransportTypeSuccess extends SecondStepState {}

class SubmitSecondStepLoading extends SecondStepState {}

class SubmitSecondStepSuccess extends SecondStepState {}

class SubmitSecondStepFailure extends SecondStepState {
  final String message;
  SubmitSecondStepFailure(this.message);
}
