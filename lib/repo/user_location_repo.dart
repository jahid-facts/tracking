import 'package:tracking/utils/importer.dart';

class UserLocationRepository {
  // send current location
  Future<String> sendCordinate(User user, Cordinate cord) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri url = Uri.parse(
        'https://www.test.minimaxhealthcare.org/api/user-location/${user.id}');
    Map data = {
      'latitude': cord.lat.toString(),
      'longitude': cord.lon.toString(),
    };
    Response response =
        await put(url, headers: headers, body: jsonEncode(data));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['message']);
      return '200';
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
