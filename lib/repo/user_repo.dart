import 'package:tracking/utils/importer.dart';

class UserRepository {
  // get User
  getUser({
    required String email,
    required String password,
    required String deviceID,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri url =
        Uri.parse('https://www.test.minimaxhealthcare.org/api/user-login');
    Map data = {
      'email': email,
      'password': password,
      'deviceId': deviceID,
    };
    Response response =
        await post(url, headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var userJson = jsonResponse['user'];
      if (jsonResponse['validation'] != 'Failed') {
        return User.fromJson(userJson);
      }
      // Assuming you have a User class with a factory constructor 'fromJson'
    }
    throw Exception(response.reasonPhrase);
  }
}
