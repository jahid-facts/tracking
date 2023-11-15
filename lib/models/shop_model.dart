import 'package:tracking/utils/importer.dart';

class Shop extends Equatable {
  final int id;
  final String name;
  final String? number;
  final String status;
  final String address;
  final double? latitude;
  final double? longitude;
  final String description;

  const Shop({
    required this.id,
    required this.name,
    required this.number,
    required this.status,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    print(json);
    return Shop(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      status: json['status'],
      // address: json['address'],
      address: 'Unknown',
      latitude: double.tryParse(json['latitude'] ?? '') ?? 0.0,
      longitude: double.tryParse(json['longitude'] ?? '') ?? 0.0,
      description: json['description'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        number,
        status,
        address,
        latitude,
        longitude,
        description,
      ];
}
