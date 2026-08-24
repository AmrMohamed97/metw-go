import 'package:metw_go/features/faq/data/models/faq_response.dart';

abstract class FaqState {}

class FaqInitialState extends FaqState {}

class FaqLoadingState extends FaqState {}

class FaqSuccessState extends FaqState {
  final FaqDataModel faqData;

  FaqSuccessState(this.faqData);
}

class FaqFailureState extends FaqState {
  final String message;

  FaqFailureState(this.message);
}
