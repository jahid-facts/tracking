import "package:tracking/utils/importer.dart";

final navigatorKey = GlobalKey<NavigatorState>();

double  getScreenHeight() => MediaQuery.of(navigatorKey.currentState!.context).size.height;
double  getScreenWidth() => MediaQuery.of(navigatorKey.currentState!.context).size.width;

