import 'package:json_annotation/json_annotation.dart';

part 'wallet_overview_response.g.dart';

@JsonSerializable()
class WalletOverviewResponse {
  final bool? success;
  final String? message;
  final WalletOverviewDataModel? data;

  WalletOverviewResponse({this.success, this.message, this.data});

  factory WalletOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletOverviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WalletOverviewResponseToJson(this);
}

@JsonSerializable()
class WalletOverviewDataModel {
  final WalletDataModel? wallet;
  final TodayPerformanceModel? today;
  @JsonKey(name: 'weekly_performance')
  final WeeklyPerformanceModel? weeklyPerformance;

  WalletOverviewDataModel({this.wallet, this.today, this.weeklyPerformance});

  factory WalletOverviewDataModel.fromJson(Map<String, dynamic> json) =>
      _$WalletOverviewDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletOverviewDataModelToJson(this);
}

@JsonSerializable()
class WalletDataModel {
  final num? balance;
  @JsonKey(name: 'pending_withdrawals')
  final num? pendingWithdrawals;
  @JsonKey(name: 'available_balance')
  final num? availableBalance;
  final String? currency;
  @JsonKey(name: 'currency_label')
  final String? currencyLabel;
  @JsonKey(name: 'min_withdrawal')
  final num? minWithdrawal;
  @JsonKey(name: 'can_withdraw')
  final bool? canWithdraw;

  WalletDataModel({
    this.balance,
    this.pendingWithdrawals,
    this.availableBalance,
    this.currency,
    this.currencyLabel,
    this.minWithdrawal,
    this.canWithdraw,
  });

  factory WalletDataModel.fromJson(Map<String, dynamic> json) =>
      _$WalletDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDataModelToJson(this);
}

@JsonSerializable()
class TodayPerformanceModel {
  final num? earnings;
  @JsonKey(name: 'completed_orders')
  final int? completedOrders;
  @JsonKey(name: 'growth_percentage')
  final num? growthPercentage;
  @JsonKey(name: 'growth_direction')
  final String? growthDirection;
  final String? currency;
  @JsonKey(name: 'currency_label')
  final String? currencyLabel;

  TodayPerformanceModel({
    this.earnings,
    this.completedOrders,
    this.growthPercentage,
    this.growthDirection,
    this.currency,
    this.currencyLabel,
  });

  factory TodayPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$TodayPerformanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodayPerformanceModelToJson(this);
}

@JsonSerializable()
class WeeklyPerformanceModel {
  @JsonKey(name: 'total_earnings')
  final num? totalEarnings;
  @JsonKey(name: 'completed_orders')
  final int? completedOrders;
  @JsonKey(name: 'max_chart_value')
  final num? maxChartValue;
  final String? currency;
  @JsonKey(name: 'currency_label')
  final String? currencyLabel;
  final List<DayPerformanceModel>? days;

  WeeklyPerformanceModel({
    this.totalEarnings,
    this.completedOrders,
    this.maxChartValue,
    this.currency,
    this.currencyLabel,
    this.days,
  });

  factory WeeklyPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPerformanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyPerformanceModelToJson(this);
}

@JsonSerializable()
class DayPerformanceModel {
  final String? date;
  @JsonKey(name: 'day_name')
  final String? dayName;
  @JsonKey(name: 'day_short')
  final String? dayShort;
  final num? earnings;
  @JsonKey(name: 'completed_orders')
  final int? completedOrders;

  DayPerformanceModel({
    this.date,
    this.dayName,
    this.dayShort,
    this.earnings,
    this.completedOrders,
  });

  factory DayPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$DayPerformanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayPerformanceModelToJson(this);
}
