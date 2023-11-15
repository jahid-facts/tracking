import 'package:tracking/utils/importer.dart';

class ShopsRepository {
  // get Shops
  Future<List<Shop>> getShops(
      {required int userId, required String date}) async {
    Response res = await get(Uri.parse(
        'https://www.test.minimaxhealthcare.org/api/find-task/1/2023-11-14'));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['shop'];
      return result.map((element) => Shop.fromJson(element)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
