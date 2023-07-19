import "package:tracking/utils/importer.dart";

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // decoration: const BoxDecoration(
            //   color: Colors.blue,
            // ),
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: const Center(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(ImagesUtils.profileImages),
                      backgroundColor: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Md Jahid Hasan',
                  style: TextStyle(
                    color: Color(0xFF4cb97e),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
              color: Color(0xFF4cb97e),
            ),
            title: const Text('Dashboard',
                style: TextStyle(
                  color: Color(0xFF4cb97e),
                  fontSize: 14,
                )),
            tileColor: const Color.fromARGB(255, 223, 255, 238),
            onTap: () {
              // Handle item 1 click
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const MenuIeam(
            menuName: 'Employees List',
            icons: Icons.man_2,
          ),
          const SizedBox(
            height: 10,
          ),
          const MenuIeam(
            menuName: 'Employees Task List',
            icons: Icons.task,
          ),
          const SizedBox(
            height: 10,
          ),
          const MenuIeam(
            menuName: 'Employees Daily Task',
            icons: Icons.list,
          ),
          const SizedBox(
            height: 10,
          ),
          const MenuIeam(
            menuName: 'Today Active Employees',
            icons: Icons.task_alt_rounded,
          ),
          const SizedBox(
            height: 10,
          ),
          const MenuIeam(
            menuName: 'Employees Map',
            icons: Icons.map,
          ),
        ],
      ),
    );
  }
}
