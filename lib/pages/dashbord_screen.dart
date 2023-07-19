import "package:tracking/utils/importer.dart";

class DashbordScreen extends StatelessWidget {
  DashbordScreen({super.key});
  static const route = '/dashbord';
  final double width = getScreenWidth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          children: [
            verticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImagesUtils.logoImages),
                Builder(
                  builder: (context) => InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                ),
              ],
            ),
            verticalSpace(),
            TextField(
              decoration: textFieldDecoration(
                prefixIcon: const Icon(Icons.search),
                hint: 'Try to find',
              ),
            ),
            // Card
            // spaceV(20.0),
            verticalSpace(),
            Card(
              color: whitePrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: primaryColor, width: 1.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Welcome back,"),
                        // spaceV(5.0),
                        verticalSpace(),
                        const Text(
                          "Md Jahid Hasan",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // spaceV(10.0),
                        verticalSpace(),
                        SizedBox(
                          width: width * 0.39,
                          child: const Text(
                            "Today your route is Dhanmondi To Savar. Please complete your tasks.",
                            // textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                    Image.asset(
                      ImagesUtils.loginImages,
                      width: width * 0.3,
                    )
                  ],
                ),
              ),
            ),
            // visited shop
            // spaceV(size.height * 0.05),
            verticalSpace(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Shops Visited Today"), Text("40%")],
            ),
            verticalSpace(height: 0.005),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  minHeight: 10.0,
                  value: 0.4, // the progress value (from 0.0 to 1.0)
                  backgroundColor: whitePrimaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    primaryColor, // the background color
                  ), // the progress bar color
                ),
              ),
            ),

            // Not visited Shop

            verticalSpace(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Shops Not Visited Today"), Text("60%")],
            ),

            verticalSpace(height: 0.005),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: secondaryColor,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const LinearProgressIndicator(
                  minHeight: 10.0,
                  value: 0.6, // the progress value (from 0.0 to 1.0)
                  backgroundColor: whitePrimaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    secondaryColor, // the background color
                  ), // the progress bar color
                ),
              ),
            ),
            // spaceV(5.0),
            verticalSpace(),
            const Text("312 of 5678 Completed"),

            verticalSpace(height: 0.005),
            // Card
            Card(
              color: whitePrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              child: ListTile(
                leading: SizedBox(
                  height: 60.0,
                  width: 80.0,
                  child: Container(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    child: Icon(
                      size: 40.0,
                      Icons.shopping_bag_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                title: const Text("Targeted shop"),
                subtitle: const Text("5678"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
