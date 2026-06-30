import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_router.dart';
import 'package:metw_go/core/theme/app_theme.dart';

class MetwGo extends StatelessWidget {
  const MetwGo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard iOS design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt<AppCubit>(),
          child: BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) => current is! ChangeThemeState,
            builder: (context, state) {
              final isDark = context.read<AppCubit>().isDarkMode;
              return ThemeProvider(
                initTheme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
                duration: const Duration(milliseconds: 800),
                builder: (context, theme) {
                  return MaterialApp.router(
                    title: 'Metw Go',
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: context.read<AppCubit>().currentLocale,
                    theme: theme,
                    routerConfig: AppRouter.router,
                    debugShowCheckedModeBanner: false,
                    builder: (context, child) => ThemeSwitchingArea(
                      child: child!,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
