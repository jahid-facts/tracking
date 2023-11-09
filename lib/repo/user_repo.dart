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
      // 'deviceID': deviceID,
    };
    print(deviceID);
    Response response =
        await post(url, headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var userJson = jsonResponse['user'];
      // Assuming you have a User class with a factory constructor 'fromJson'
      return User.fromJson(userJson);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
