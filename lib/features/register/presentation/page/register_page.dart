import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/view/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showToast(
            context,
            message:
                state.registerOutModel.message ??
                AppLocalizations.of(context)!.register,
            state: ToastStates.success,
          );
          context.go(AppRoutes.login);
        }
      },
      builder: (context, state) {
        // final cubit = context.read<RegisterCubit>();
        return ScreenWrapper(
          backGroundColor: Theme.of(context).colorScheme.scrim,
          body: RegisterBody(),
          
        );
      },
    );
  }
}
