import 'package:metw_go/features/login/data/models/login_out_model/login_out_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginOutModel? loginOutModel;
  LoginSuccess({this.loginOutModel});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

class ChangeObscureState extends LoginState {}
