import 'package:tracking/utils/importer.dart';

class UserLocationRepository {
  // send current location
  Future<String> sendCordinate(User user, Cordinate cord) async {
    String url = 'https://www.test.minimaxhealthcare.org/api/users/${user.id}';
    Response res = await put(Uri.parse(url), body: {cord.toJson()});
    if (res.statusCode == 200) {
      return '200';
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
