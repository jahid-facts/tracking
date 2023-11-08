import 'package:device_info_plus/device_info_plus.dart';

Future<Map> getDeviceInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  return deviceInfo.data;
}
