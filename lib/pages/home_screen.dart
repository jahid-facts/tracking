import 'package:tracking/utils/importer.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    // DashbordScreen(),
    // const Shopscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: blackPrimaryColor.withOpacity(0.65),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.shopping_bag_outlined),
          //   label: 'Shop',
          // ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) => setState(() {
          selectedIndex = index;
        }),
      ),
    );
  }
}
