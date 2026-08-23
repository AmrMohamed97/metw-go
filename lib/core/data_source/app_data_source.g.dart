// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_source.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _AppDataSource implements AppDataSource {
  _AppDataSource(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://lasco.evyx.lol/api/metwgo/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<EmptyResponse> logout() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<EmptyResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'auth/logout',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late EmptyResponse _value;
    try {
      _value = EmptyResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<StartOrderResponse> acceptStartOrder({required String orderId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<StartOrderResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'orders/{${orderId}}/start',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late StartOrderResponse _value;
    try {
      _value = StartOrderResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<OrderActionResponse> arriveAtPickupOrder({
    required String orderId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<OrderActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'orders/{${orderId}}/arrive-pickup',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrderActionResponse _value;
    try {
      _value = OrderActionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<OrderActionResponse> confirmPickupOrder({
    required String orderId,
    File? proofPhoto,
    String? signature,
    String? packageCountVerified,
    String? packageConditionVerified,
    String? merchantSignatureObtained,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (proofPhoto != null) {
      _data.files.add(
        MapEntry(
          'proof_photo',
          MultipartFile.fromFileSync(
            proofPhoto.path,
            filename: proofPhoto.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (signature != null) {
      _data.fields.add(MapEntry('signature', signature));
    }
    if (packageCountVerified != null) {
      _data.fields.add(
        MapEntry('checklist[package_count_verified]', packageCountVerified),
      );
    }
    if (packageConditionVerified != null) {
      _data.fields.add(
        MapEntry(
          'checklist[package_condition_verified]',
          packageConditionVerified,
        ),
      );
    }
    if (merchantSignatureObtained != null) {
      _data.fields.add(
        MapEntry(
          'checklist[merchant_signature_obtained]',
          merchantSignatureObtained,
        ),
      );
    }
    final _options = _setStreamType<OrderActionResponse>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'orders/{${orderId}}/pickup-confirmation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrderActionResponse _value;
    try {
      _value = OrderActionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<OrderActionResponse> arriveAtDropoffOrder({
    required String orderId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<OrderActionResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'orders/{${orderId}}/arrive-dropoff',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrderActionResponse _value;
    try {
      _value = OrderActionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<OrderActionResponse> completeDeliveryOrder({
    required String orderId,
    File? proofPhoto,
    String? signature,
    String? recipientOtp,
    String? collectedAmount,
    String? deliveryNote,
    String? recipientName,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (proofPhoto != null) {
      _data.files.add(
        MapEntry(
          'proof_photo',
          MultipartFile.fromFileSync(
            proofPhoto.path,
            filename: proofPhoto.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (signature != null) {
      _data.fields.add(MapEntry('signature', signature));
    }
    if (recipientOtp != null) {
      _data.fields.add(MapEntry('recipient_otp', recipientOtp));
    }
    if (collectedAmount != null) {
      _data.fields.add(MapEntry('collected_amount', collectedAmount));
    }
    if (deliveryNote != null) {
      _data.fields.add(MapEntry('delivery_note', deliveryNote));
    }
    if (recipientName != null) {
      _data.fields.add(MapEntry('recipient_name', recipientName));
    }
    final _options = _setStreamType<OrderActionResponse>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'orders/{${orderId}}/complete-delivery',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrderActionResponse _value;
    try {
      _value = OrderActionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
