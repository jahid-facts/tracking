import 'package:tracking/utils/importer.dart';

class LauncherScreen extends StatelessWidget {
  static const String route = '/launch';
  const LauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is UserInitialState) {
          return const LoginScreen();
        } else if (state is UserLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is UserLoadedState) {
          BlocProvider.of<UserLocationBloc>(context)
              .add(FetchUserLocation(user: state.user));
          return DashbordScreen();
        } else {
          return const LoginScreen(
            hasOccurredError: true,
          );
        }
      },
    );
  }
}
