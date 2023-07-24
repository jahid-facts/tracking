import 'package:tracking/utils/importer.dart';


class ShopsRepository {
  // get Shops
  Future<List<Shop>> getShops() async {
    Response res = await get(Uri.parse('https://www.test.minimaxhealthcare.org/api/shop'));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['shop'];
      return result.map((e) => Shop.fromJson(e)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
