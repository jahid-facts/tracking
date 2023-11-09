import 'package:url_launcher/url_launcher.dart';

import 'importer.dart';

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

Future<Map> getDeviceInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  return deviceInfo.data;
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
