import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/view/first_view.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  /// global data in register
  //----------------------------------------------------------------------------
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

  /// first view data
  //----------------------------------------------------------------------------
  bool isMale = true;

  void changeGender(bool value) {
    isMale = value;
    emit(ChangeGenderSuccess());
  }

  final firstViewFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstPhoneController = TextEditingController();
  TextEditingController secondPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController boarnDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void firstViewPress() =>
      firstViewFormKey.currentState?.validate() == true ? changePage(1) : null;

  /// second view data
  //----------------------------------------------------------------------------

  @override
  Future<void> close() {
    pageController.dispose();
    // stepProgressController.dispose();
    return super.close();
  }
}
