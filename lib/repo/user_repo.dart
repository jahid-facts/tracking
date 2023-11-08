import 'package:tracking/utils/importer.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // get User
  getUser({
    required String email,
    required String password,
    required String deviceID,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var url =
        Uri.parse('https://www.test.minimaxhealthcare.org/api/user-login');
    var data = {'email': email, 'password': password, 'deviceID': deviceID};
    var response =
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
