// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
  todayEarnings: json['today_earnings'] as num?,
  completedOrdersToday: json['completed_orders_today'] as num?,
  plannedOrdersToday: json['planned_orders_today'] as num?,
  walletBalance: json['wallet_balance'] as num?,
);

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
  'today_earnings': instance.todayEarnings,
  'completed_orders_today': instance.completedOrdersToday,
  'planned_orders_today': instance.plannedOrdersToday,
  'wallet_balance': instance.walletBalance,
};
