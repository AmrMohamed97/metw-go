// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fourth_step_data_source.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _FourthStepDataSource implements FourthStepDataSource {
  _FourthStepDataSource(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://lasco.evyx.lol/api/metwgo/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<FirstStepOutModel> submitFourthStep(
    File profilePhoto,
    File nationalIdFront,
    File nationalIdBack,
    File drivingLicenseFront,
    File drivingLicenseBack,
    File vehicleLicenseFront,
    File vehicleLicenseBack,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(
      MapEntry(
        'profile_photo',
        MultipartFile.fromFileSync(
          profilePhoto.path,
          filename: profilePhoto.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'national_id_front',
        MultipartFile.fromFileSync(
          nationalIdFront.path,
          filename: nationalIdFront.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'national_id_back',
        MultipartFile.fromFileSync(
          nationalIdBack.path,
          filename: nationalIdBack.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'driving_license_front',
        MultipartFile.fromFileSync(
          drivingLicenseFront.path,
          filename: drivingLicenseFront.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'driving_license_back',
        MultipartFile.fromFileSync(
          drivingLicenseBack.path,
          filename: drivingLicenseBack.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'vehicle_license_front',
        MultipartFile.fromFileSync(
          vehicleLicenseFront.path,
          filename: vehicleLicenseFront.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    _data.files.add(
      MapEntry(
        'vehicle_license_back',
        MultipartFile.fromFileSync(
          vehicleLicenseBack.path,
          filename: vehicleLicenseBack.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    final _options = _setStreamType<FirstStepOutModel>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'auth/register/step-5',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FirstStepOutModel _value;
    try {
      _value = FirstStepOutModel.fromJson(_result.data!);
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
