import 'package:tracking/utils/all_files.dart';

class SingUpScreen extends StatelessWidget {
  static const route = '/sing_up';
  SingUpScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
