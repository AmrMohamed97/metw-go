import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is ApplogoutLogoutSuccessState) {
          context.go(
            AppRoutes.login,
          ); // Navigate to the login page after successful logout
        } else if (state is ApplogoutErrorState) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final appCubit = context.read<AppCubit>();
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            title: Text(
              AppLocalizations.of(context)!.logout,
              style: AppTextStyle.medium16(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            leading: state is ApplogoutLoadingState
                ? CupertinoActivityIndicator()
                : Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
            onTap: () {
              appCubit.logout(); // Call the logout method from AppCubit
              // Add logout logic
            },
          ),
        );
      },
    );
  }
}
