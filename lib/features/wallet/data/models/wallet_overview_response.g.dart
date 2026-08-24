// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletOverviewResponse _$WalletOverviewResponseFromJson(
  Map<String, dynamic> json,
) => WalletOverviewResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : WalletOverviewDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WalletOverviewResponseToJson(
  WalletOverviewResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

WalletOverviewDataModel _$WalletOverviewDataModelFromJson(
  Map<String, dynamic> json,
) => WalletOverviewDataModel(
  wallet: json['wallet'] == null
      ? null
      : WalletDataModel.fromJson(json['wallet'] as Map<String, dynamic>),
  today: json['today'] == null
      ? null
      : TodayPerformanceModel.fromJson(json['today'] as Map<String, dynamic>),
  weeklyPerformance: json['weekly_performance'] == null
      ? null
      : WeeklyPerformanceModel.fromJson(
          json['weekly_performance'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WalletOverviewDataModelToJson(
  WalletOverviewDataModel instance,
) => <String, dynamic>{
  'wallet': instance.wallet,
  'today': instance.today,
  'weekly_performance': instance.weeklyPerformance,
};

WalletDataModel _$WalletDataModelFromJson(Map<String, dynamic> json) =>
    WalletDataModel(
      balance: json['balance'] as num?,
      pendingWithdrawals: json['pending_withdrawals'] as num?,
      availableBalance: json['available_balance'] as num?,
      currency: json['currency'] as String?,
      currencyLabel: json['currency_label'] as String?,
      minWithdrawal: json['min_withdrawal'] as num?,
      canWithdraw: json['can_withdraw'] as bool?,
    );

Map<String, dynamic> _$WalletDataModelToJson(WalletDataModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'pending_withdrawals': instance.pendingWithdrawals,
      'available_balance': instance.availableBalance,
      'currency': instance.currency,
      'currency_label': instance.currencyLabel,
      'min_withdrawal': instance.minWithdrawal,
      'can_withdraw': instance.canWithdraw,
    };

TodayPerformanceModel _$TodayPerformanceModelFromJson(
  Map<String, dynamic> json,
) => TodayPerformanceModel(
  earnings: json['earnings'] as num?,
  completedOrders: (json['completed_orders'] as num?)?.toInt(),
  growthPercentage: json['growth_percentage'] as num?,
  growthDirection: json['growth_direction'] as String?,
  currency: json['currency'] as String?,
  currencyLabel: json['currency_label'] as String?,
);

Map<String, dynamic> _$TodayPerformanceModelToJson(
  TodayPerformanceModel instance,
) => <String, dynamic>{
  'earnings': instance.earnings,
  'completed_orders': instance.completedOrders,
  'growth_percentage': instance.growthPercentage,
  'growth_direction': instance.growthDirection,
  'currency': instance.currency,
  'currency_label': instance.currencyLabel,
};

WeeklyPerformanceModel _$WeeklyPerformanceModelFromJson(
  Map<String, dynamic> json,
) => WeeklyPerformanceModel(
  totalEarnings: json['total_earnings'] as num?,
  completedOrders: (json['completed_orders'] as num?)?.toInt(),
  maxChartValue: json['max_chart_value'] as num?,
  currency: json['currency'] as String?,
  currencyLabel: json['currency_label'] as String?,
  days: (json['days'] as List<dynamic>?)
      ?.map((e) => DayPerformanceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeeklyPerformanceModelToJson(
  WeeklyPerformanceModel instance,
) => <String, dynamic>{
  'total_earnings': instance.totalEarnings,
  'completed_orders': instance.completedOrders,
  'max_chart_value': instance.maxChartValue,
  'currency': instance.currency,
  'currency_label': instance.currencyLabel,
  'days': instance.days,
};

DayPerformanceModel _$DayPerformanceModelFromJson(Map<String, dynamic> json) =>
    DayPerformanceModel(
      date: json['date'] as String?,
      dayName: json['day_name'] as String?,
      dayShort: json['day_short'] as String?,
      earnings: json['earnings'] as num?,
      completedOrders: (json['completed_orders'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DayPerformanceModelToJson(
  DayPerformanceModel instance,
) => <String, dynamic>{
  'date': instance.date,
  'day_name': instance.dayName,
  'day_short': instance.dayShort,
  'earnings': instance.earnings,
  'completed_orders': instance.completedOrders,
};
