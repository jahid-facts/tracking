import 'package:tracking/utils/all_files.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Top menu
                spaceV(size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/logo.png'),
                    Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.primary,
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
                spaceV(size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shop list",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              // horizontal: 18.0,
                              // vertical: 4.0
                              ),
                          child: Center(
                            child: Text(
                              "De-active",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                spaceV(size.height * 0.02),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: false,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: false,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                      spaceV(10.0),
                      const ShopCard(
                        name: 'Adi Store',
                        address: 'Dhanmondi, Dhaka',
                        userCode: 23456,
                        isActive: true,                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// user Card
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
      color: Theme.of(context).colorScheme.secondary,
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
          left: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 28.0*2,
                width: 28.0*2,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(5.0),
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                spaceV(10.0),
                Text(address),
                Text("Code: $userCode"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 75.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
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
                    color: isActive
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          // horizontal: 18.0,
                          // vertical: 4.0
                          ),
                      child: Center(
                        child: Text(
                          isActive ? "Active" : "De-active",
                          style: TextStyle(
                            color: isActive
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                          ),
                        ),
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
