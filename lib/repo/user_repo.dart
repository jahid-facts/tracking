import 'package:tracking/utils/importer.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // get User
  getUser({
    required String email,
    required String password,
  }) async {
    // Response res = await post(
    //   Uri.parse('https://www.test.minimaxhealthcare.org/api/user-login'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode({
    //     "email": email,
    //     "password": password,
    //   }),
    // );
    // if (res.statusCode == 200) {
    //   final Map<String, dynamic> result = jsonDecode(res.body).user;
    //   return User.fromJson(result);
    // } else {
    //   throw Exception(res.reasonPhrase);
    // }
//--------------------

    var headers = {'Content-Type': 'application/json'};
    var url =
        Uri.parse('https://www.test.minimaxhealthcare.org/api/user-login');
    var data = {'email': email, 'password': password};
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
    // //----------
    // var headers = {'Content-Type': 'application/json'};
    // var request = http.Request('POST',
    //     Uri.parse('https://www.test.minimaxhealthcare.org/api/user-login'));
    // request.body =
    //     json.encode({"email": "aaa@gamil.com", "password": "11111111"});
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> result = jsonDecode(response.stream.bytesToString()['user'])
    //   print(await response.stream.bytesToString());
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
  }
}
