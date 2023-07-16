import 'package:tracking/utils/all_files.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';
  LoginScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
      
      ),
    );
  }
}
