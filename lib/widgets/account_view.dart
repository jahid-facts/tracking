import 'package:tracking/utils/all_files.dart';


class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceV(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Google',
                    style: TextStyle(fontSize: 26.0),
                  ),
                  Image.asset(
                    'assets/unnamed.png',
                    height: 18.0,
                  ),
                ],
              ),
              spaceV(30.0),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today Employee Task',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(77, 186, 128, 1),
                  ),
                ],
              ),
              spaceV(26.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: 3.0),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 30.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Md Jahid Hasan',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      spaceV(10.0),
                      const Text('Dhanmondi, Dhaka'),
                      const Text('Code : 1205'),
                      const Text('01700000000'),
                    ],
                  ),
                  const Text('Date : 29-09-2023'),
                ],
              ),
              spaceV(16.0),
              const Text('Area : Dhaka'),
              const Text('Select Shop'),
              spaceV(16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return const ShopCard(
                      name: 'Adi Store',
                      address: 'Dhanmondi',
                      userCode: 23456,
                      isActive: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final String name;
  final String address;
  final int userCode;
  final bool isActive;
  const ShopCard({
    super.key,
    required this.name,
    required this.address,
    required this.userCode,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
            color: Theme.of(context).colorScheme.primary, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 8.0,
          bottom: 8.0,
          left: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                shape: CircleBorder(side: BorderSide()),
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.orange.withOpacity(.32);
                  }
                  return Theme.of(context).colorScheme.onPrimary;
                }),
                value: false,
                onChanged: (isChange) {},
                // checkColor: Theme.of(context).colorScheme.onPrimary,
                activeColor: Colors.red,
              ),
            ),
            Container(
              height: 28.0 * 2,
              width: 28.0 * 2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(15.0),
              ),
              // color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Icon(
                  Icons.shop_2_rounded,
                  size: 28.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                spaceV(10.0),
                Text(
                  address,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Code: $userCode",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 75.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "view",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                spaceV(10.0),
                Container(
                  width: 75.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "View info",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
