import 'package:tracking/utils/importer.dart';


class UsersRepository {
  // get User
  Future<List<User>> getUsers() async {
    Response res = await get(Uri.parse('https://www.test.minimaxhealthcare.org/api/users'));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['users'];
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
