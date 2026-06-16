import 'package:flutter/material.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/page/onboard_content.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(body: OnBoardContent());
  }
}
