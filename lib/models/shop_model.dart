import 'package:tracking/utils/importer.dart';

class Shop extends Equatable {
  final int id;
  final String name;
  final String description;
  final String? number;
  final double? latitude;
  final double? longitude;
  final String status;
  final String shopCode;

  const Shop({
    required this.id,
    required this.name,
    required this.description,
    required this.number,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.shopCode,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      number: json['number'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'],
      shopCode: json['shop_code'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        description,
        number,
        latitude,
        longitude,
        status,
        shopCode,
      ];
}
