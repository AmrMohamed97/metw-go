abstract class FifthStepState {}

class FifthStepInitial extends FifthStepState {}

class SubmitFifthStepLoading extends FifthStepState {}

class SubmitFifthStepSuccess extends FifthStepState {}

class SubmitFifthStepFailure extends FifthStepState {
  final String message;
  SubmitFifthStepFailure(this.message);
}
