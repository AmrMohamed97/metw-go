import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/login/data/repo/login_repo.dart';
import 'package:metw_go/features/login/presentation/manager/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    emit(ChangeObscureState());
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      // Perform login logic here
      final result = await loginRepo.login(
        phone: phoneController.text,
        password: passwordController.text,
      );
      // Emit appropriate state based on the result
      result.fold(
        (failure) => emit(LoginFailure(failure.message)),
        (loginOutModel) => emit(LoginSuccess(loginOutModel: loginOutModel)),
      );
    }
  }
}
