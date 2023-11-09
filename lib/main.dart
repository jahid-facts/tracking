import "package:tracking/utils/importer.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
            create: (context) => UserRepository()),
        RepositoryProvider<UserLocationRepository>(
            create: (context) => UserLocationRepository()),
        RepositoryProvider<ShopsRepository>(
            create: (context) => ShopsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider(
            create: (context) => UserLocationBloc(
                RepositoryProvider.of<UserLocationRepository>(context)),
          ),
          BlocProvider(
            create: (context) =>
                ShopsBloc(RepositoryProvider.of<ShopsRepository>(context))
                  ..add(LoadShopsEvent()),
          ),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: getTheme(),
          debugShowCheckedModeBanner: false,
          home: const LauncherScreen(),
          routes: allRouts,
        ),
      ),
    );
  }
}
