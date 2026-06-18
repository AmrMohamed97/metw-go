import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/login/presentation/manager/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}