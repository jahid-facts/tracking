import 'package:flutter/material.dart';

class MyTabbedLayout extends StatefulWidget {
  const MyTabbedLayout({super.key});
  static const route = '/home';

  @override
  // ignore: library_private_types_in_public_api
  _MyTabbedLayoutState createState() => _MyTabbedLayoutState();
}

class _MyTabbedLayoutState extends State<MyTabbedLayout>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
