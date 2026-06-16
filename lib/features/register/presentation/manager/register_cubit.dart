import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/view/first_view.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    emit(ChangePageSuccess()); // هنا StepProgress هيتحدث تلقائيًا
  }

  List<Widget> pages = [
    FirstView(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  ///first part data
  //----------------------------------------------------------------------------
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstPhoneController = TextEditingController();
  TextEditingController secondPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController boarnDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Future<void> close() {
    pageController.dispose();
    // stepProgressController.dispose();
    return super.close();
  }
}
