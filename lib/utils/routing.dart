import 'package:tracking/utils/all_files.dart';


const authRoute = '/auth';
const launcherRoute = '/launch';
const homeRoute = '/home';
const addProductRoute = '/addProduct';
const loginRoute = '/login';
const singUpScreenRoute = '/sing_up';

Map<String, WidgetBuilder> allRouts = {
  launcherRoute: (context) => const LauncherScreen(),
  homeRoute: (context) => HomeScreen(),
  authRoute: (context) => HomeScreen(),
  addProductRoute: (context) => const AddProductScreen(),
  loginRoute: (context) => LoginScreen(),
  singUpScreenRoute: (context) => SingUpScreen(),
};
