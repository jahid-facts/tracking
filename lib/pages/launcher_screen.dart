import "package:tracking/utils/importer.dart";

class LauncherScreen extends StatelessWidget {
  static const String route = '/launch';
  const LauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitialState) {
          return const LoginScreen();
        } else if (state is UserLoadedState) {
          return DashbordScreen();
        } else if (state is UserErrorState) {
          return AlertDialogWidget(
            title: 'Login error',
            massege: 'Wrong credentials. Please enter valid credentials.',
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(ResetUserEvent());
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LauncherScreen.route, (route) => false);
            },
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
