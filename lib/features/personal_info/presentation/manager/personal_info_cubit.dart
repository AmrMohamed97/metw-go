import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/personal_info/data/models/update_personal_info_input_model.dart';
import 'package:metw_go/features/personal_info/data/repo/personal_info_repo.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_state.dart';

@injectable
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final PersonalInfoRepo personalInfoRepo;

  PersonalInfoCubit({required this.personalInfoRepo})
      : super(PersonalInfoInitialState());

  bool isMale = true;

  void changeGender(bool value) {
    isMale = value;
    emit(ChangeGenderSuccess());
  }

  final firstViewFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstPhoneController = TextEditingController();
  TextEditingController secondPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController boarnDateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  Future<void> updatePersonalInfo() async {
    if (firstViewFormKey.currentState?.validate() == true) {
      emit(UpdatePersonalInfoLoading());
      final inputModel = UpdatePersonalInfoInputModel(
        firstName: firstNameController.text,
        fatherName: fatherNameController.text,
        lastName: lastNameController.text,
        phone: firstPhoneController.text,
        secondaryPhone: secondPhoneController.text,
        email: emailController.text,
        birthDate: boarnDateController.text,
        gender: isMale ? 'male' : 'female',
        addressDetails: addressController.text,
      );
      final result = await personalInfoRepo.updatePersonalInfo(inputModel);
      result.fold(
        (failure) => emit(UpdatePersonalInfoFailure(failure.message)),
        (profileOutModel) => emit(UpdatePersonalInfoSuccess(profileOutModel)),
      );
    }
  }

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

  @override
  Future<void> close() {
    firstNameController.dispose();
    fatherNameController.dispose();
    lastNameController.dispose();
    firstPhoneController.dispose();
    secondPhoneController.dispose();
    emailController.dispose();
    boarnDateController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    currentPasswordController.dispose();
    return super.close();
  }
}
