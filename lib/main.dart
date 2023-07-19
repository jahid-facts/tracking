import "package:tracking/utils/importer.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: whiteSecondaryColor,
        primaryTextTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          // titleLarge: const TextStyle(
          //   fontSize: 30.0,
          //   fontFamily: 'roboto',
          //   fontWeight: FontWeight.w500,
          // ),
          displayLarge: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: blackPrimaryColor),
          displayMedium: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: blackPrimaryColor),
          displaySmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: blackPrimaryColor),
          bodyLarge: const TextStyle(fontSize: 16, color: blackPrimaryColor),
          bodyMedium: const TextStyle(fontSize: 14, color: blackPrimaryColor),
          bodySmall: const TextStyle(fontSize: 12, color: blackPrimaryColor),
          titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: blackPrimaryColor),
          titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: blackPrimaryColor),
          titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: blackPrimaryColor),
          labelLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: blackPrimaryColor),
          labelMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: blackPrimaryColor),
          labelSmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimaryColor),
        ),
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light().copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LauncherScreen(),
      routes: allRouts,
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