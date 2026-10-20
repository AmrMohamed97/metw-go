import 'destination_bus_station.dart';
import 'origin_bus_station.dart';

class StartShipmentInputModel {
  OriginBusStation? originBusStation;
  DestinationBusStation? destinationBusStation;
  num? acceptedFee;

  StartShipmentInputModel({
    this.originBusStation,
    this.destinationBusStation,
    this.acceptedFee,
  });

  factory StartShipmentInputModel.fromJson(Map<String, dynamic> json) {
    return StartShipmentInputModel(
      originBusStation: json['origin_bus_station'] == null
          ? null
          : OriginBusStation.fromJson(
              Map<String, dynamic>.from(json['origin_bus_station']),
            ),
      destinationBusStation: json['destination_bus_station'] == null
          ? null
          : DestinationBusStation.fromJson(
              Map<String, dynamic>.from(json['destination_bus_station']),
            ),
      acceptedFee: num.tryParse(json['accepted_fee'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    if (originBusStation != null)
      'origin_bus_station': originBusStation?.toJson(),
    if (destinationBusStation != null)
      'destination_bus_station': destinationBusStation?.toJson(),
    if (acceptedFee != null) 'accepted_fee': acceptedFee,
  };
}
