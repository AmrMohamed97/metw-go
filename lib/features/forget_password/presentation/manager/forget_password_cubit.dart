import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_state.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/forget_password/data/models/forget_password_input_model.dart';
import 'package:metw_go/features/forget_password/data/repo/forget_password_repo.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());

  final phoneController = TextEditingController();

  Future<void> sendOtp() async {
    emit(ForgetPasswordLoading());
    final inputModel = ForgetPasswordInputModel(phone: phoneController.text);
    final result = await forgetPasswordRepo.sendOtp(inputModel);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (successModel) => emit(ForgetPasswordSuccess(successModel)),
    );
  }
}
