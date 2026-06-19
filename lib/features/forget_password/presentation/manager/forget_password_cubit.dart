import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
}
