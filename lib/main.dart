import "package:tracking/utils/importer.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UsersRepository>(
            create: (context) => UsersRepository()),
        RepositoryProvider<ShopsRepository>(
            create: (context) => ShopsRepository()),
        RepositoryProvider<UserLocationRepository>(
            create: (context) => UserLocationRepository()),
        RepositoryProvider<UserRepository>(
            create: (context) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UsersBloc(RepositoryProvider.of<UsersRepository>(context))
                  ..add(LoadUsersEvent()),
          ),
          BlocProvider(
            create: (context) =>
                ShopsBloc(RepositoryProvider.of<ShopsRepository>(context))
                  ..add(LoadShopsEvent()),
          ),
          BlocProvider(
            create: (context) => CordinateBloc(
                RepositoryProvider.of<UserLocationRepository>(context)),
          ),
          BlocProvider(
            create: (context) => UserLocationBloc()..add(FetchLocation()),
          ),
          BlocProvider(
            create: (context) =>
                UserBloc(RepositoryProvider.of<UserRepository>(context)),
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
 /* 
ColorScheme()
ColorScheme.dark()
ColorScheme.fromSeed()
ColorScheme.fromSwatch()
ColorScheme.highContrastDark()
ColorScheme.highContrastLight()
ColorScheme.light()
  */