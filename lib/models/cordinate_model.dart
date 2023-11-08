// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tracking/utils/importer.dart';

class Cordinate extends Equatable {
  final double lat;
  final double lon;
  const Cordinate({
    required this.lat,
    required this.lon,
  });
  String toJson() {
    return jsonEncode({'lat': lat, 'lon': lon});
  }

  @override
  List<Object?> get props => [lat, lon];
}
