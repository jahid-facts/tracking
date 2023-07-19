import "package:tracking/utils/importer.dart";

class AuthScreen extends StatelessWidget {
  static const route = '/auth';
  AuthScreen({
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
