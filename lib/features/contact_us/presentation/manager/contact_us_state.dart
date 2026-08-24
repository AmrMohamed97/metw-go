import 'package:metw_go/features/contact_us/data/models/contact_us_response.dart';

abstract class ContactUsState {}

class ContactUsInitialState extends ContactUsState {}

class ContactUsLoadingState extends ContactUsState {}

class ContactUsSuccessState extends ContactUsState {
  final ContactUsDataModel data;

  ContactUsSuccessState(this.data);
}

class ContactUsFailureState extends ContactUsState {
  final String message;

  ContactUsFailureState(this.message);
}
