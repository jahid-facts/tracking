import 'importer.dart';

String getDate(int index) {
  DateTime date = DateTime.now();
  DateTime resultDate = date.add(Duration(days: index));

  String formattedDate =
      '${resultDate.year}-${resultDate.month}-${resultDate.day}';

  return formattedDate;
}

void launchWaze(Cordinate cor) async {
  final Uri url1 = Uri.parse('waze://?ll=${cor.lat},${cor.lon}&navigate=yes');
  final Uri url2 = Uri.parse(
      'https://www.waze.com/ul?ll=${cor.lat},${cor.lon}&navigate=yes');

  try {
    if (await canLaunchUrl(url1)) {
      await launchUrl(url1);
    } else if (await canLaunchUrl(url2)) {
      await launchUrl(url2);
    }
  } catch (e) {
    // window.open('https://www.waze.com/ul?ll=${cor.lat},${cor.lon}&navigate=yes',
    //     'Waze');
  }
}

Future<String> getDeviceId() async {
  final DeviceInfoPlugin device = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await device.androidInfo;
    return androidInfo.androidId;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await device.iosInfo;
    // return iosInfo.data['identifierForVendor'];
    return iosInfo.identifierForVendor;
  }

  return '';
}

void showToastMessage(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(
        msg, // Retrieve the error message from the state
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    ),
  );
}
