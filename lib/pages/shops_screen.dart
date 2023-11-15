import 'package:tracking/utils/importer.dart';

class Shopsscreen extends StatelessWidget {
  final String date;
  const Shopsscreen({super.key, required this.date});
  static const route = '/shops';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: Set the logo
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
              TextField(
                decoration: textFieldDecoration(
                  hint: 'Try to find',
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
              verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Shop list',
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
                      child: Center(
                        child: Text(
                          date,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(),
              BlocBuilder<ShopsBloc, ShopsState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is ShopsInitialState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ShopsLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.shops.length,
                        itemBuilder: (context, index) =>
                            ShopCard(shop: state.shops[index]),
                      ),
                    );
                    // return Builder(builder: (context)=>Center());
                    // ;
                  } else if (state is ShopsErrorState) {
                    return Center(
                      child: Text(state.errorMassege),
                    );
                  }
                  return const Center();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// user Card
class ShopCard extends StatelessWidget {
  final Shop shop;

  const ShopCard({
    super.key,
    required this.shop,
  });

  void _openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.5, // 50% of the screen height
          color: Colors.white,
          child: Column(
            children: [
              verticalSpace(height: 0.1),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Table(
                    border: TableBorder.all(
                      width: 1.0,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    children: [
                      TableRow(
                        children: [
                          const TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Shop name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 13, 13, 14)),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  shop.name,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 13, 13, 14)),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  shop.address,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 13, 13, 14)),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  shop.number ?? '01700000000',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      Cordinate cor = Cordinate(
                          lat: shop.latitude ?? 23.742382288941503,
                          lon: shop.longitude ?? 90.38655512197339);
                      launchWaze(cor);
                    },
                    child: const Text(
                      'view map',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whitePrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              height: 32.0 * 2,
              width: 32.0 * 2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7.5),
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
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shop.name, style: Theme.of(context).textTheme.bodyLarge),
                  verticalSpace(height: 0.01),
                  Text(shop.address),
                  Text('Code: ${shop.id}'),
                ],
              ),
            ),
            Column(
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
                    onTap: () {
                      _openModal(context);
                    },
                    child: Center(
                      child: Text(
                        'view info',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                // spaceV(10.0),
                verticalSpace(height: 0.012),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
