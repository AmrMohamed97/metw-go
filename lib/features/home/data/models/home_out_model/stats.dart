import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

@JsonSerializable()
class Stats {
  @JsonKey(name: 'today_earnings')
  num? todayEarnings;
  @JsonKey(name: 'completed_orders_today')
  num? completedOrdersToday;
  @JsonKey(name: 'planned_orders_today')
  num? plannedOrdersToday;
  @JsonKey(name: 'wallet_balance')
  num? walletBalance;

  Stats({
    this.todayEarnings,
    this.completedOrdersToday,
    this.plannedOrdersToday,
    this.walletBalance,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
