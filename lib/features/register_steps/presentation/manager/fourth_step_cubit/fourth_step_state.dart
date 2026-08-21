abstract class FourthStepState {}

class FourthStepInitial extends FourthStepState {}

class PickDocumentImageLoading extends FourthStepState {}

class PickDocumentImageSuccess extends FourthStepState {}

class SubmitFourthStepLoading extends FourthStepState {}

class SubmitFourthStepSuccess extends FourthStepState {}

class SubmitFourthStepFailure extends FourthStepState {
  final String message;
  SubmitFourthStepFailure(this.message);
}
