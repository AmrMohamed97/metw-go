import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/auth/presentation/manager/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  PageController pageController = PageController();
  int currentPage = 0;

 void changePage(int index) {
  currentPage = index;
  emit(ChangePageSuccess()); // هنا StepProgress هيتحدث تلقائيًا
}



  @override
  Future<void> close() {
    pageController.dispose();
    // stepProgressController.dispose();
    return super.close();
  }
}
