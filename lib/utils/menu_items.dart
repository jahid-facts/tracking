import 'package:flutter/material.dart';

class MenuIeam extends StatelessWidget {
  final String menuName;
  
  final IconData?  icons;

  const MenuIeam({super.key, required this.menuName, this.icons});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icons),
      title: Text(
        menuName,
        style: const TextStyle(
          color: Color.fromARGB(255, 75, 75, 75),
          fontSize: 14,
        ),
      ),
      tileColor: const Color.fromARGB(255, 247, 247, 247),
      onTap: () {
        // route name here
      },
    );
  }
}