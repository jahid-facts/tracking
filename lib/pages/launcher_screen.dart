import "package:tracking/utils/importer.dart";




class LauncherScreen extends StatefulWidget {

  static const route = '/launch';
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), (){
      Navigator.of(context).pushNamed(HomeScreen.route);
    });

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
       child: CircularProgressIndicator(),
      ),
    );
  }
}



