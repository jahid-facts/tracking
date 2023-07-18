import 'dart:async';

import 'package:tracking/utils/all_files.dart';



class LauncherScreen extends StatefulWidget {

  static const route = '/launch';
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5), (){
      Navigator.of(context).pushNamed(LoginScreen.route);
    });

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
       
      ),
    );
  }
}



