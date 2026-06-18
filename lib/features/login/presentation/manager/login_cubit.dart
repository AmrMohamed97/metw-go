import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/login/presentation/manager/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}