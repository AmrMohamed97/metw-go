import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/features/home/presentation/services/location_service.dart';
import 'package:metw_go/features/home/presentation/services/native_tracking_service.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class HomePageOfflineStatusCard extends StatefulWidget {
  const HomePageOfflineStatusCard({super.key, required this.durationSeconds});
  final num durationSeconds;

  @override
  State<HomePageOfflineStatusCard> createState() =>
      _HomePageOfflineStatusCardState();
}

class _HomePageOfflineStatusCardState
    extends State<HomePageOfflineStatusCard> {
  Timer? _timer;
  late int _currentSeconds;

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.durationSeconds.toInt();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant HomePageOfflineStatusCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.durationSeconds != widget.durationSeconds) {
      _currentSeconds = widget.durationSeconds.toInt();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentSeconds++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    final hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
              ),
              8.horizontalSpace,
              Text(
                AppLocalizations.of(context)!.unavailableForWork,
                style: AppTextStyle.regular14(
                  context,
                ).copyWith(color: const Color(0xFFEAEAEA)),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.surface.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: const Color(0xFFEAEAEA),
                      size: 16.sp,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDuration(_currentSeconds),
                      style: AppTextStyle.regular14(
                        context,
                      ).copyWith(color: const Color(0xFFEAEAEA)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          6.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.activateStatusToReceiveOrders,
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: const Color(0xFFEAEAEA), height: 1.5),
                ),
              ),
              16.horizontalSpace,
              CustomButton(
                text: AppLocalizations.of(context)!.readyToReceive,
                onPressed: () async {
                  final locationService = LocationService();
                  bool serviceEnabled = await locationService
                      .checkAndRequestLocationService();
                  if (!serviceEnabled) {
                    await ph.openAppSettings();
                  }
                  bool permissionGranted = await locationService
                      .checkAndRequestPermission();
                  if (!permissionGranted) {
                    await ph.openAppSettings();
                  }
                  NativeTrackingService().startNativeTracking('9');
                },
                height: 35,
                horizontalPadding: 16,
                textColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
