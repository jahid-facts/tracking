import 'package:tracking/utils/importer.dart';

const launcherRoute = '/launch';
const homeRoute = '/home';
const loginRoute = '/login';
const dashbordScreenRoute = '/dashbord';
// const shopsScreenRoute = '/shops';

Map<String, WidgetBuilder> allRouts = {
  launcherRoute: (context) => const LauncherScreen(),
  homeRoute: (context) => const HomeScreen(),
  loginRoute: (context) => const LoginScreen(),
  // dashbordScreenRoute: (context) => DashbordScreen(),
  // shopsScreenRoute: (context) => const Shopsscreen(),
};
