abstract class FirstStepState {}

class FirstStepInitial extends FirstStepState {}

class ChangeDelegateTypeSuccess extends FirstStepState {}

class ChangeWorkClassificationSuccess extends FirstStepState {}

class GetWarehousesLoading extends FirstStepState {}

class GetWarehousesSuccess extends FirstStepState {}

class GetWarehousesFailure extends FirstStepState {
  final String message;
  GetWarehousesFailure(this.message);
}

class GetTransportTypesLoading extends FirstStepState {}

class GetTransportTypesSuccess extends FirstStepState {}

class GetTransportTypesFailure extends FirstStepState {
  final String message;
  GetTransportTypesFailure(this.message);
}

class SubmitFirstStepLoading extends FirstStepState {}

class SubmitFirstStepSuccess extends FirstStepState {}

class SubmitFirstStepFailure extends FirstStepState {
  final String message;
  SubmitFirstStepFailure(this.message);
}
