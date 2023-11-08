import "package:tracking/utils/importer.dart";

class Shopscreen extends StatelessWidget {
  const Shopscreen({super.key});
  static const route = '/shop';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
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
                ],
              ),
              verticalSpace(),
              BlocBuilder<ShopsBloc, ShopsState>(
                bloc: BlocProvider.of<ShopsBloc>(context),
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is ShopsInitialState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ShopsLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.shops.length,
                        itemBuilder: (context, index) => ShopCard(
                          name: state.shops[index].name,
                          address: state.shops[index].description,
                          userCode: state.shops[index].address,
                          isActive: state.shops[index].status == '1',
                        ),
                      ),
                    );
                    // return Builder(builder: (context)=>Center());
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

// // user Card
// class ShopCard extends StatelessWidget {
//   final String name;
//   final String address;
//   final String userCode;
//   final bool isActive;
//   const ShopCard({
//     super.key,
//     required this.name,
//     required this.address,
//     required this.userCode,
//     required this.isActive,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: whitePrimaryColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         side: BorderSide(color: Theme.of(context).colorScheme.primary),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(right: 10.0),
//               height: 32.0 * 2,
//               width: 32.0 * 2,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(7.5),
//               ),
//               // color: Theme.of(context).colorScheme.primary,
//               child: Center(
//                 child: Icon(
//                   Icons.shop_2_rounded,
//                   size: 28.0,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(name, style: Theme.of(context).textTheme.bodyLarge),
//                   verticalSpace(height: 0.01),
//                   Text(address),
//                   Text("Code: $userCode"),
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 Container(
//                   width: 75.0,
//                   height: 25.0,
//                   decoration: BoxDecoration(
//                     color:
//                         Theme.of(context).colorScheme.primary.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(3.0),
//                   ),
//                   child: InkWell(
//                     onTap: () {},
//                     child: Center(
//                       child: Text(
//                         "view",
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // spaceV(10.0),
//                 verticalSpace(height: 0.012),

//                 Container(
//                   width: 75.0,
//                   height: 25.0,
//                   decoration: BoxDecoration(
//                     color: isActive
//                         ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
//                         : Theme.of(context).colorScheme.secondary,
//                     borderRadius: BorderRadius.circular(3.0),
//                   ),
//                   child: InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           // horizontal: 18.0,
//                           // vertical: 4.0
//                           ),
//                       child: Center(
//                         child: Text(
//                           isActive ? "Active" : "De-active",
//                           style: TextStyle(
//                             color: isActive
//                                 ? Theme.of(context).colorScheme.primary
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
