import 'package:metw_go/features/forget_password/data/models/change_password_out_model.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_out_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ChangeObscureState extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordOutModel forgetPasswordOutModel;

  ForgetPasswordSuccess(this.forgetPasswordOutModel);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;

  ForgetPasswordFailure(this.message);
}

class ChangePasswordLoading extends ForgetPasswordState {}

class ChangePasswordSuccess extends ForgetPasswordState {
  final ChangePasswordOutModel changePasswordOutModel;

  ChangePasswordSuccess(this.changePasswordOutModel);
}

class ChangePasswordFailure extends ForgetPasswordState {
  final String message;

  ChangePasswordFailure(this.message);
}
