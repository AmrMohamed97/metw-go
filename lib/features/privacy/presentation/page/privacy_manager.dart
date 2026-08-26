import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/privacy/presentation/manager/privacy_cubit.dart';
import 'package:metw_go/features/privacy/presentation/manager/privacy_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyManager extends StatefulWidget {
  const PrivacyManager({super.key});

  @override
  State<PrivacyManager> createState() => _PrivacyManagerState();
}

class _PrivacyManagerState extends State<PrivacyManager> {
  WebViewController? _webViewController;
  int _loadingProgress = 0;
  bool _hasWebError = false;
  String? _loadedUrl;

  void _initWebViewController(String url) {
    if (_loadedUrl == url && _webViewController != null) return;
    _loadedUrl = url;
    _hasWebError = false;

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                _loadingProgress = progress;
              });
            }
          },
          onPageStarted: (url) {
            if (mounted) {
              setState(() {
                _hasWebError = false;
                _loadingProgress = 10;
              });
            }
          },
          onPageFinished: (url) {
            if (mounted) {
              setState(() {
                _loadingProgress = 100;
              });
            }
          },
          onWebResourceError: (error) {
            if (mounted) {
              setState(() {
                _hasWebError = true;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrivacyCubit, PrivacyState>(
      listener: (context, state) {
        if (state is PrivacyFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
        if (state is PrivacySuccessState) {
          final url = state.privacyData.webviewUrl;
          if (url != null && url.isNotEmpty) {
            _initWebViewController(url);
          }
        }
      },
      builder: (context, state) {
        final cubit = context.read<PrivacyCubit>();
        final title =
            cubit.privacyData?.title ??
            AppLocalizations.of(context)!.privacyPolicy;
        final webUrl = cubit.privacyData?.webviewUrl;

        return ScreenWrapper(
          appBar: CustomAppBar(title: title),
          body: _buildBody(context, cubit, state, webUrl),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    PrivacyCubit cubit,
    PrivacyState state,
    String? webUrl,
  ) {
    if (state is PrivacyLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is PrivacyFailureState && (webUrl == null || webUrl.isEmpty)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: AppTextStyle.medium14(context),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            ElevatedButton(
              onPressed: () => cubit.getPrivacy(),
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      );
    }

    if (webUrl == null || webUrl.isEmpty) {
      return Center(
        child: Text(
          'رابط سياسة الخصوصية غير متوفر حالياً',
          style: AppTextStyle.medium14(context),
        ),
      );
    }

    if (_webViewController == null) {
      _initWebViewController(webUrl);
    }

    return Column(
      children: [
        if (_loadingProgress < 100)
          LinearProgressIndicator(
            value: _loadingProgress / 100.0,
            color: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.1),
          ),
        Expanded(
          child: _hasWebError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_outlined,
                        size: 48.sp,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      12.verticalSpace,
                      Text(
                        'تعذر تحميل الصفحة',
                        style: AppTextStyle.medium16(context),
                      ),
                      16.verticalSpace,
                      ElevatedButton(
                        onPressed: () {
                          _webViewController?.reload();
                        },
                        child: Text(AppLocalizations.of(context)!.retry),
                      ),
                    ],
                  ),
                )
              : WebViewWidget(controller: _webViewController!),
        ),
      ],
    );
  }
}
