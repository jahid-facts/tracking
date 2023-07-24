import 'package:tracking/utils/importer.dart';

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is showing user current location'),
            verticalSpace(),
            BlocBuilder<UserLocationBloc, UserLocationState>(
              builder: (context, state) {
                if (state is UserLocationInitialState) {
                  return const CircularProgressIndicator();
                } else if (state is UserLocationChangedState) {
                  return Text(
                    'Latitude: ${state.locationData.latitude}, Longitude: ${state.locationData.longitude}',
                  );
                } else if (state is UserLocationErrorState) {
                  return Text(state.error);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
