class OriginBusStation {
	String? name;
	String? address;
	String? availability;
	String? cityId;

	OriginBusStation({
		this.name, 
		this.address, 
		this.availability, 
		this.cityId, 
	});

	factory OriginBusStation.fromJson(Map<String, dynamic> json) {
		return OriginBusStation(
			name: json['name']?.toString(),
			address: json['address']?.toString(),
			availability: json['availability']?.toString(),
			cityId: json['city_id']?.toString(),
		);
	}



	Map<String, dynamic> toJson() => {
				if (name != null) 'name': name,
				if (address != null) 'address': address,
				if (availability != null) 'availability': availability,
				if (cityId != null) 'city_id': cityId,
			};
}
