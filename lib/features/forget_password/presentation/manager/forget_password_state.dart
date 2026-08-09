import 'package:metw_go/features/forget_password/data/models/forget_password_out_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordOutModel forgetPasswordOutModel;

  ForgetPasswordSuccess(this.forgetPasswordOutModel);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;

  ForgetPasswordFailure(this.message);
}
