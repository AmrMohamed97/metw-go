import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/view/fifth_view.dart';
import 'package:metw_go/features/register/presentation/view/first_view.dart';
import 'package:metw_go/features/register/presentation/view/fourth_view.dart';
import 'package:metw_go/features/register/presentation/view/second_view.dart';
import 'package:metw_go/features/register/presentation/view/third_view.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> with ImageMixin{
  RegisterCubit() : super(RegisterInitial());

  /// global data in register
  //----------------------------------------------------------------------------
  PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int index) {
    if (currentPage == index) return;
    currentPage = index;
    if (pageController.hasClients && pageController.page?.round() != index) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(ChangePageSuccess()); // هنا StepProgress هيتحدث تلقائيًا
  }

  List<Widget> pages = [
    FirstView(),
    SecondView(),
    ThirdView(),
    FourthView(),
    FifthView(),
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
  void firstViewPress() {
    changePage(1);
    // if (firstViewFormKey.currentState?.validate() == true) {
    //   changePage(1);
    // }
  }

  /// second view data
  //----------------------------------------------------------------------------
  final secondViewFormKey = GlobalKey<FormState>();
  bool isIndependentDelegate = true;
  String? selectedWarehouse;

  void changeDelegateType(bool isIndependent) {
    isIndependentDelegate = isIndependent;
    emit(ChangeDelegateTypeSuccess());
  }

  bool isDeliveryDelegate = false;
  bool isShippingDelegate = false;
  bool isBusDriver = false;

  void toggleDeliveryDelegate(bool value) {
    isDeliveryDelegate = value;
    emit(ChangeWorkClassificationSuccess());
  }

  void toggleShippingDelegate(bool value) {
    isShippingDelegate = value;
    emit(ChangeWorkClassificationSuccess());
  }

  void toggleBusDriver(bool value) {
    isBusDriver = value;
    emit(ChangeWorkClassificationSuccess());
  }

  void secondViewPress(BuildContext context) {
    // First, check if form fields (like warehouse dropdown) are valid
    if (secondViewFormKey.currentState?.validate() == true) {
      // Validate work classification
      if (!isDeliveryDelegate && !isShippingDelegate && !isBusDriver) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.errChooseWorkClassification,
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      changePage(2);
    }
  }

  /// thired view data
  //----------------------------------------------------------------------------
  final thirdViewFormKey = GlobalKey<FormState>();
  String? selectedTransportMethod;
  TextEditingController maxWeightController = TextEditingController();
  TextEditingController maxVolumeController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  File? vehicleImage;

  Future<void> pickVehicleImage(ImageSource source) async {

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      emit(PickVehicleImageLoading());
      vehicleImage=await compress(targetImage: File(image.path));
      // vehicleImagePath = image.path;
      emit(PickVehicleImageSuccess());
    }
  }

  void thirdViewPress(BuildContext context) {
    if (thirdViewFormKey.currentState?.validate() == true) {
      if (vehicleImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.errUploadVehicleImage),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      changePage(3);
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    // stepProgressController.dispose();
    return super.close();
  }
}
