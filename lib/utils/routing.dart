import "package:tracking/utils/importer.dart";


const authRoute = '/auth';
const launcherRoute = '/launch';
const homeRoute = '/home';
const addProductRoute = '/addProduct';
const loginRoute = '/login';
const singUpScreenRoute = '/sing_up';
const dashbordScreenRoute='/dashbord';
const shopScreenRoute='/shop';

Map<String, WidgetBuilder> allRouts = {
  launcherRoute: (context) => const LauncherScreen(),
  homeRoute: (context) => const HomeScreen(),
  authRoute: (context) => AuthScreen(),
  addProductRoute: (context) => const AddProductScreen(),
  loginRoute: (context) =>  const LoginScreen(),
  singUpScreenRoute: (context) => SingUpScreen(),
  dashbordScreenRoute: (context) => DashbordScreen(),
  shopScreenRoute: (context) => const Shopscreen(),
};
