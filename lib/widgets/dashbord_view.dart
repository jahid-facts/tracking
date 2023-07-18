import 'package:tracking/utils/all_files.dart';


class DashbordView extends StatelessWidget {
   DashbordView({super.key});
  
  final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>(); 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: ListView(
            children: [
              //  Top menu
              spaceV(size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo.png'),
                  InkWell(
                    onTap: (){
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              // Search field
              spaceV(size.height * 0.02),
              const TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Try to find',
                ),
              ),
              // Card
              spaceV(20.0),
              Card(
                color: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1.0),
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
                          spaceV(5.0),
                          const Text(
                            "Md Jahid Hasan",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          spaceV(10.0),
                          SizedBox(
                            width: size.width * 0.39,
                            child: const Text(
                              "Today your route is Dhanmondi To Savar. Please complete your tasks.",
                              // textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/bg_login.png',
                        width: size.width * 0.3,
                      )
                    ],
                  ),
                ),
              ),
              // visited shop
              spaceV(size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Shops Visited Today"), Text("40%")],
              ),
              spaceV(10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    minHeight: 10.0,
                    value: 0.4, // the progress value (from 0.0 to 1.0)
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context)
                          .colorScheme
                          .primary, // the background color
                    ), // the progress bar color
                  ),
                ),
              ),
              spaceV(5.0),
              const Text("356 of 5678 Completed"),
              // Not visited Shop
              spaceV(size.height * 0.05),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Shops Not Visited Today"), Text("60%")],
              ),
              spaceV(10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.error,
                    width: 1.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    minHeight: 10.0,
                    value: 0.6, // the progress value (from 0.0 to 1.0)
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context)
                          .colorScheme
                          .error, // the background color
                    ), // the progress bar color
                  ),
                ),
              ),
              spaceV(5.0),
              const Text("312 of 5678 Completed"),

              // Card
              spaceV(size.height * 0.05),
              SizedBox(
                height: 80.0,
                child: Card(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.0),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: SizedBox(
                        height: 60.0,
                        width: 80.0,
                        child: Container(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
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
                ),
              ),
              const Expanded(
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
