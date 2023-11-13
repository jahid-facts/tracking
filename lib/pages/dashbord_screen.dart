import 'package:tracking/utils/importer.dart';

class DashbordScreen extends StatelessWidget {
  DashbordScreen({Key? key}) : super(key: key);
  static const route = '/dashbord';
  final double width = getScreenWidth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: ListView(
            // scrollDirection:,
            children: [
              verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImagesUtils.logoImages),
                  Builder(builder: (context) {
                    return InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  }),
                ],
              ),
              verticalSpace(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Shopsscreen(
                                  date: getDate(index),
                                )));
                      },
                      leading: const Icon(Icons.calendar_month),
                      title: Text('Day ${index + 1}'),
                      subtitle: Text(getDate(index)),
                    ),
                  );
                  // Card(
                  //   elevation:
                  //       5, // Change the elevation for the shadow effect
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(
                  //         15.0), // Adjust the value as needed
                  //   ),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, '/shops');
                  //     },
                  //     child: ListTile(
                  //       title: Text('Day ${index + 1}'),
                  //       subtitle: const Padding(
                  //         padding: EdgeInsets.only(
                  //             top: 8.0), // Adjust the top margin as needed
                  //         child: Text('12-12-12'),
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
