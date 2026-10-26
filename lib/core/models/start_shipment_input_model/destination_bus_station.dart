class DestinationBusStation {
  String? name;
  String? address;
  String? availability;
  dynamic cityId;
  num? acceptedFee;

  DestinationBusStation({
    this.name,
    this.address,
    this.availability,
    this.cityId,
    this.acceptedFee,
  });

  factory DestinationBusStation.fromJson(Map<String, dynamic> json) {
    return DestinationBusStation(
      name: json['name']?.toString(),
      address: json['address']?.toString(),
      availability: json['availability']?.toString(),
      cityId: json['city_id'],
      acceptedFee: num.tryParse(json['accepted_fee']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    if (name != null) 'name': name,
    if (address != null) 'address': address,
    if (availability != null) 'availability': availability,
    if (cityId != null) 'city_id': cityId,
    if (acceptedFee != null) 'accepted_fee': acceptedFee,
  };
}

