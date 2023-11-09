import 'package:tracking/utils/importer.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // get User
  getUser({
    required String email,
    required String password,
  }) async {
    Map deviceInfo = await getDeviceInfo();
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri url =
        Uri.parse('https://www.test.minimaxhealthcare.org/api/user-login');
    Map data = {
      'email': email,
      'password': password,
      'deviceID': deviceInfo['identifierForVendor'],
    };
    Response response =
        await http.post(url, headers: headers, body: jsonEncode(data));

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
