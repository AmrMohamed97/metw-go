import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_state.dart';

@injectable
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit() : super(PersonalInfoInitialState());

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
  // TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  

  bool showPasswordFields = false;

  void togglePasswordFields() {
    showPasswordFields = !showPasswordFields;
    emit(ChangeOpsecureState());
  }

  bool currentObscurePassword = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    emit(ChangeOpsecureState());
  }
  void changeConfirmObscurePassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    emit(ChangeOpsecureState());
  }
  void changecurrentObscurePassword() {
    currentObscurePassword = !currentObscurePassword;
    emit(ChangeOpsecureState());
  }
}
