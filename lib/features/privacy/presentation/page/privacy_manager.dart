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
  String? _loadedKey;
  bool _isUsingHtmlFallback = false;

  void _initWebViewController({String? url, String? htmlContent}) {
    final key = url ?? 'html_${htmlContent.hashCode}';
    if (_loadedKey == key && _webViewController != null) return;
    _loadedKey = key;
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
          onPageStarted: (startedUrl) {
            if (mounted) {
              setState(() {
                _hasWebError = false;
                _loadingProgress = 10;
              });
            }
          },
          onPageFinished: (finishedUrl) {
            if (mounted) {
              setState(() {
                _loadingProgress = 100;
              });
            }
          },
          onWebResourceError: (error) {
            if (mounted) {
              final html =
                  context.read<PrivacyCubit>().privacyData?.effectiveHtml;
              if (html != null && html.isNotEmpty && !_isUsingHtmlFallback) {
                _isUsingHtmlFallback = true;
                _hasWebError = false;
                _webViewController?.loadHtmlString(_wrapHtml(html, context));
              } else {
                setState(() {
                  _hasWebError = true;
                });
              }
            }
          },
        ),
      );

    if (url != null && url.isNotEmpty) {
      _isUsingHtmlFallback = false;
      _webViewController!.loadRequest(Uri.parse(url));
    } else if (htmlContent != null && htmlContent.isNotEmpty) {
      _isUsingHtmlFallback = true;
      _webViewController!.loadHtmlString(_wrapHtml(htmlContent, context));
    }
  }

  String _wrapHtml(String bodyContent, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? '#EDEDED' : '#1A1A1A';
    final bgColor = isDark ? '#121212' : '#FFFFFF';
    final primaryColor =
        '#${(Theme.of(context).colorScheme.primary.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';

    return '''
<!DOCTYPE html>
<html dir="rtl" lang="ar">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <style>
    * {
      box-sizing: border-box;
      -webkit-tap-highlight-color: transparent;
    }
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Cairo", "Tahoma", sans-serif;
      padding: 16px 20px;
      margin: 0;
      direction: rtl;
      text-align: right;
      line-height: 1.8;
      font-size: 15px;
      color: $textColor;
      background-color: $bgColor;
    }
    p {
      margin-top: 0;
      margin-bottom: 12px;
    }
    strong, b {
      font-weight: 700;
    }
    u {
      text-decoration: underline;
    }
    .ql-direction-rtl {
      direction: rtl;
      text-align: right;
    }
    .ql-align-right {
      text-align: right;
    }
    .ql-align-center {
      text-align: center;
    }
    .ql-align-left {
      text-align: left;
    }
    a {
      color: $primaryColor;
      text-decoration: none;
    }
    span[style*="color: rgb(36, 36, 36)"] {
      color: $textColor !important;
    }
  </style>
</head>
<body>
  $bodyContent
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrivacyCubit, PrivacyState>(
      listener: (context, state) {
        if (state is PrivacyFailureState) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
        if (state is PrivacySuccessState) {
          final url = state.privacyData.effectiveUrl;
          final html = state.privacyData.effectiveHtml;
          if ((url != null && url.isNotEmpty) ||
              (html != null && html.isNotEmpty)) {
            _initWebViewController(url: url, htmlContent: html);
          }
        }
      },
      builder: (context, state) {
        final cubit = context.read<PrivacyCubit>();
        final title =
            cubit.privacyData?.title ??
            AppLocalizations.of(context)!.privacyPolicy;
        final data = cubit.privacyData;

        return ScreenWrapper(
          appBar: CustomAppBar(title: title),
          body: _buildBody(context, cubit, state, data),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    PrivacyCubit cubit,
    PrivacyState state,
    dynamic data,
  ) {
    if (state is PrivacyLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    final url = cubit.privacyData?.effectiveUrl;
    final html = cubit.privacyData?.effectiveHtml;
    final hasContent =
        (url != null && url.isNotEmpty) || (html != null && html.isNotEmpty);

    if (state is PrivacyFailureState && !hasContent) {
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

    if (!hasContent) {
      return Center(
        child: Text(
          'محتوى سياسة الخصوصية غير متوفر حالياً',
          style: AppTextStyle.medium14(context),
        ),
      );
    }

    if (_webViewController == null) {
      _initWebViewController(url: url, htmlContent: html);
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
                          if (url != null && url.isNotEmpty) {
                            _hasWebError = false;
                            _isUsingHtmlFallback = false;
                            _webViewController?.loadRequest(Uri.parse(url));
                          } else if (html != null && html.isNotEmpty) {
                            _hasWebError = false;
                            _isUsingHtmlFallback = true;
                            _webViewController?.loadHtmlString(
                              _wrapHtml(html, context),
                            );
                          } else {
                            cubit.getPrivacy();
                          }
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
