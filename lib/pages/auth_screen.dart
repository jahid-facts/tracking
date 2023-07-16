import 'package:tracking/utils/all_files.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/auth';
  HomeScreen({
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
