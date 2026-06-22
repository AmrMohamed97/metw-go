import 'package:jazaer_app/core/router/app_routes.dart';
import 'package:jazaer_app/core/theme/app_text_style.dart';
import 'package:jazaer_app/core/theme/my_colors.dart';
import 'package:jazaer_app/core/utils/app_images.dart';
import 'package:jazaer_app/features/assign_location/presentation/widget/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:go_router/go_router.dart';

class OpenLocationPage extends StatefulWidget {
  const OpenLocationPage({super.key});

  @override
  State<OpenLocationPage> createState() => _OpenLocationPageState();
}

class _OpenLocationPageState extends State<OpenLocationPage>
    with WidgetsBindingObserver {
  bool _isChecking = true;
  bool _isLocationEnabled = false;
  bool _openedSettings = false; // Flag to track if we opened settings
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkAndRequestLocation();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Only check if we explicitly opened settings and are returning
    if (state == AppLifecycleState.resumed && _openedSettings) {
      _openedSettings = false; // Reset flag
      _checkAndRequestLocation();
    }
  }

  Future<void> _checkAndRequestLocation() async {
    try {
      setState(() {
        _isChecking = true;
      });

      // 1. Check Service
      bool serviceEnabled = await _locationService
          .checkAndRequestLocationService();
      if (!serviceEnabled) {
        setState(() {
          _isChecking = false;
          _isLocationEnabled = false;
        });
        return;
      }

      // 2. Check Permission
      bool permissionGranted = await _locationService
          .checkAndRequestPermission();
      if (!permissionGranted) {
        setState(() {
          _isChecking = false;
          _isLocationEnabled = false;
        });
        return;
      }

      // 3. Success - Fetch Location
      setState(() {
        _isLocationEnabled = true;
      });

      _locationService.getCurrentLocation((LocationData locationData) {
        if (!mounted) return;

        // Print as requested
        // print(
        //   "User Location: Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}",
        // );

        // Stop checking and navigate
        setState(() {
          _isChecking = false;
        });

        if (locationData.latitude != null && locationData.longitude != null) {
          context.go(
            AppRoutes.delivery,
            // extra: (locationData.latitude!, locationData.longitude!),
          );
        }
      });
    } catch (e) {
      debugPrint("Error getting location: $e");
      setState(() {
        _isChecking = false;
        _isLocationEnabled = false; // Fallback to denied/error view
      });
    }
  }

  Future<void> _openSettings() async {
    _openedSettings = true;
    await ph.openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background - Expressive Location Theme
          Positioned.fill(
            child: Opacity(
              opacity: 0.25, // Subtle background
              child: Image.asset(
                AppImages.map, // Using map asset as background
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(child: Center(child: _buildContent())),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isChecking && !_isLocationEnabled) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(color: MyColors.darkBlueNormal),
          SizedBox(height: 20.h),
          Text(
            "جاري التحقق من الموقع...",
            style: AppTextStyle.medium16(context),
          ),
        ],
      );
    }

    if (_isLocationEnabled) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_rounded,
            size: 80.sp,
            color: MyColors.darkBlueNormal,
          ),
          SizedBox(height: 20.h),
          Text(
            "تم تفعيل تتبع الموقع بنجاح ✅",
            style: AppTextStyle.bold16(context),
          ),
          SizedBox(height: 10.h),
          Text(
            "نستخدم موقعك فقط لتحسين دقة التوصيل وتسريع العمل، ولن يتم استخدامه خارج التطبيق.",
            style: AppTextStyle.regular14(context).copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    // Permission/Service Denied State
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: MyColors.darkBlueNormal.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_disabled_rounded,
              size: 60.sp,
              color: MyColors.darkBlueNormal,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            "يرجى تفعيل خدمة الموقع",
            style: AppTextStyle.bold18(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Text(
            "نحتاج إلى معرفة موقعك الحالي لتقديم خدمة أفضل. يرجى الذهاب للإعدادات وتفعيل الموقع.",
            style: AppTextStyle.regular14(
              context,
            ).copyWith(color: Colors.grey[600], height: 1.5),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          InkWell(
            onTap: _openSettings,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: MyColors.purpleDark,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: MyColors.purpleDark.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                "الذهاب للإعدادات",
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
