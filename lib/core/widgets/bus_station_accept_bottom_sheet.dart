import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/models/start_shipment_input_model/destination_bus_station.dart';
import 'package:metw_go/core/models/start_shipment_input_model/origin_bus_station.dart';
import 'package:metw_go/core/models/start_shipment_input_model/start_shipment_input_model.dart';
import 'package:metw_go/core/network/end_point.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';

void showBusStationAcceptBottomSheet({
  required BuildContext context,
  required int assignmentId,
  required bool requiresFeeInput,
  num? offeredFee,
  num? initialFee,
  String? currency,
  required void Function(StartShipmentInputModel inputModel) onConfirm,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => BusStationAcceptBottomSheet(
      assignmentId: assignmentId,
      requiresFeeInput: requiresFeeInput,
      offeredFee: offeredFee,
      initialFee: initialFee,
      currency: currency,
      onConfirm: onConfirm,
    ),
  );
}

class BusStationAcceptBottomSheet extends StatefulWidget {
  final int assignmentId;
  final bool requiresFeeInput;
  final num? offeredFee;
  final num? initialFee;
  final String? currency;
  final void Function(StartShipmentInputModel inputModel) onConfirm;

  const BusStationAcceptBottomSheet({
    super.key,
    required this.assignmentId,
    required this.requiresFeeInput,
    this.offeredFee,
    this.initialFee,
    this.currency,
    required this.onConfirm,
  });

  @override
  State<BusStationAcceptBottomSheet> createState() =>
      _BusStationAcceptBottomSheetState();
}

class _BusStationAcceptBottomSheetState
    extends State<BusStationAcceptBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _originNameController = TextEditingController();
  final _originAddressController = TextEditingController();
  int? _originCityId;

  final _destNameController = TextEditingController();
  final _destAddressController = TextEditingController();
  int? _destCityId;

  late final TextEditingController _feeController;

  bool _isLoadingCities = true;
  String? _citiesError;
  List<CityModel> _cities = [];

  @override
  void initState() {
    super.initState();
    final defaultFee = widget.initialFee ?? widget.offeredFee;
    _feeController = TextEditingController(
      text: defaultFee != null
          ? (defaultFee % 1 == 0
              ? defaultFee.toInt().toString()
              : defaultFee.toString())
          : '',
    );
    _fetchCities();
  }

  Future<void> _fetchCities() async {
    setState(() {
      _isLoadingCities = true;
      _citiesError = null;
    });

    try {
      final dio = getIt<Dio>();
      final response = await dio.get(EndPoints.cities);
      if (response.data != null) {
        final cityResponse = CityListResponse.fromJson(response.data);
        setState(() {
          _cities = cityResponse.data ?? [];
          _isLoadingCities = false;
        });
      } else {
        setState(() {
          _citiesError = 'فشل في تحميل قائمة المدن';
          _isLoadingCities = false;
        });
      }
    } catch (e) {
      setState(() {
        _citiesError = 'حدث خطأ أثناء تحميل المدن';
        _isLoadingCities = false;
      });
    }
  }

  @override
  void dispose() {
    _originNameController.dispose();
    _originAddressController.dispose();
    _destNameController.dispose();
    _destAddressController.dispose();
    _feeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_originCityId == null) {
      showToast(
        context,
        message: 'يرجى اختيار مدينة محطة البداية',
        state: ToastStates.error,
      );
      return;
    }

    if (_destCityId == null) {
      showToast(
        context,
        message: 'يرجى اختيار مدينة محطة النهاية',
        state: ToastStates.error,
      );
      return;
    }

    num? fee;
    if (widget.requiresFeeInput) {
      fee = num.tryParse(_feeController.text.trim());
      if (fee == null || fee <= 0) {
        showToast(
          context,
          message: 'يرجى كتابة أجرة صحيحة',
          state: ToastStates.error,
        );
        return;
      }
    } else {
      fee = widget.offeredFee ?? widget.initialFee;
    }

    final input = StartShipmentInputModel(
      originBusStation: OriginBusStation(
        name: _originNameController.text.trim(),
        address: _originAddressController.text.trim(),
        availability: 'available',
        cityId: _originCityId,
        acceptedFee: fee,
      ),
      destinationBusStation: DestinationBusStation(
        name: _destNameController.text.trim(),
        address: _destAddressController.text.trim(),
        availability: 'available',
        cityId: _destCityId,
        acceptedFee: fee,
      ),
      acceptedFee: fee,
    );

    Navigator.of(context).pop();
    widget.onConfirm(input);
  }

  @override
  Widget build(BuildContext context) {
    final currency = widget.currency ?? 'ج.م';
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h + bottomInset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Grabber Handle
              Container(
                width: 44.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              16.verticalSpace,

              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.directions_bus_outlined,
                      color: MyColors.primaryColor,
                      size: 22.sp,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'بيانات محطات الأتوبيس',
                          style: AppTextStyle.bold16(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        2.verticalSpace,
                        Text(
                          'يرجى تحديد محطتي البداية والنهاية لإتمام قبول الشحنة',
                          style: AppTextStyle.regular12(context).copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),

              16.verticalSpace,

              // Body Form
              Expanded(
                child: _isLoadingCities
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : _citiesError != null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _citiesError!,
                                  style: AppTextStyle.medium14(context),
                                ),
                                12.verticalSpace,
                                TextButton(
                                  onPressed: _fetchCities,
                                  child: const Text('إعادة المحاولة'),
                                ),
                              ],
                            ),
                          )
                        : Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Fee Banner if fixed
                                  if (!widget.requiresFeeInput &&
                                      (widget.offeredFee != null ||
                                          widget.initialFee != null)) ...[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: MyColors.primaryColor
                                            .withValues(alpha: 0.08),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        border: Border.all(
                                          color: MyColors.primaryColor
                                              .withValues(alpha: 0.2),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.payments_outlined,
                                            size: 20.sp,
                                            color: MyColors.primaryColor,
                                          ),
                                          8.horizontalSpace,
                                          Text(
                                            'أجرة العرض المحسوبة: ',
                                            style:
                                                AppTextStyle.medium14(context),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${widget.offeredFee ?? widget.initialFee} $currency',
                                            style: AppTextStyle.bold16(context)
                                                .copyWith(
                                              color: MyColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    16.verticalSpace,
                                  ],

                                  // Fee Input if courier specifies fee
                                  if (widget.requiresFeeInput) ...[
                                    _buildSectionTitle(
                                      context,
                                      'أجرة المندوب المقترحة',
                                      Icons.attach_money_rounded,
                                    ),
                                    8.verticalSpace,
                                    TextFormField(
                                      controller: _feeController,
                                      keyboardType: const TextInputType
                                          .numberWithOptions(decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d+\.?\d{0,2}'),
                                        ),
                                      ],
                                      decoration: InputDecoration(
                                        hintText: 'اكتب الأجرة المطلوبة...',
                                        suffixText: currency,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                          vertical: 12.h,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'يرجى كتابة الأجرة';
                                        }
                                        final numVal =
                                            num.tryParse(value.trim());
                                        if (numVal == null || numVal <= 0) {
                                          return 'أجرة غير صحيحة';
                                        }
                                        return null;
                                      },
                                    ),
                                    16.verticalSpace,
                                  ],

                                  // Origin Bus Station Section
                                  _buildSectionTitle(
                                    context,
                                    'محطة البداية (الاستلام)',
                                    Icons.trip_origin,
                                  ),
                                  8.verticalSpace,
                                  TextFormField(
                                    controller: _originNameController,
                                    decoration: InputDecoration(
                                      labelText: 'اسم محطة البداية *',
                                      hintText: 'مثال: محطة رمسيس',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    validator: (v) =>
                                        v == null || v.trim().isEmpty
                                            ? 'اسم المحطة مطلوب'
                                            : null,
                                  ),
                                  10.verticalSpace,
                                  TextFormField(
                                    controller: _originAddressController,
                                    decoration: InputDecoration(
                                      labelText: 'عنوان المحطة *',
                                      hintText: 'مثال: ميدان رمسيس، القاهرة',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    validator: (v) =>
                                        v == null || v.trim().isEmpty
                                            ? 'عنوان المحطة مطلوب'
                                            : null,
                                  ),
                                  10.verticalSpace,
                                  DropdownButtonFormField<int>(
                                    initialValue: _originCityId,
                                    decoration: InputDecoration(
                                      labelText: 'المدينة *',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    items: _cities
                                        .map(
                                          (c) => DropdownMenuItem<int>(
                                            value: c.id,
                                            child: Text(c.name ?? ''),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        _originCityId = v;
                                      });
                                    },
                                    validator: (v) =>
                                        v == null ? 'يرجى اختيار المدينة' : null,
                                  ),

                                  20.verticalSpace,

                                  // Destination Bus Station Section
                                  _buildSectionTitle(
                                    context,
                                    'محطة النهاية (التسليم)',
                                    Icons.location_on_outlined,
                                  ),
                                  8.verticalSpace,
                                  TextFormField(
                                    controller: _destNameController,
                                    decoration: InputDecoration(
                                      labelText: 'اسم محطة النهاية *',
                                      hintText: 'مثال: محطة سيدي جابر',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    validator: (v) =>
                                        v == null || v.trim().isEmpty
                                            ? 'اسم المحطة مطلوب'
                                            : null,
                                  ),
                                  10.verticalSpace,
                                  TextFormField(
                                    controller: _destAddressController,
                                    decoration: InputDecoration(
                                      labelText: 'عنوان المحطة *',
                                      hintText: 'مثال: محطة قطار سيدي جابر، الإسكندرية',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    validator: (v) =>
                                        v == null || v.trim().isEmpty
                                            ? 'عنوان المحطة مطلوب'
                                            : null,
                                  ),
                                  10.verticalSpace,
                                  DropdownButtonFormField<int>(
                                    initialValue: _destCityId,
                                    decoration: InputDecoration(
                                      labelText: 'المدينة *',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    items: _cities
                                        .map(
                                          (c) => DropdownMenuItem<int>(
                                            value: c.id,
                                            child: Text(c.name ?? ''),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        _destCityId = v;
                                      });
                                    },
                                    validator: (v) =>
                                        v == null ? 'يرجى اختيار المدينة' : null,
                                  ),

                                  24.verticalSpace,
                                ],
                              ),
                            ),
                          ),
              ),

              // Confirm Button
              if (!_isLoadingCities && _citiesError == null)
                CustomButton(
                  text: 'تأكيد وقبول العرض',
                  onPressed: _submit,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.sp,
          color: MyColors.primaryColor,
        ),
        8.horizontalSpace,
        Text(
          title,
          style: AppTextStyle.bold14(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
