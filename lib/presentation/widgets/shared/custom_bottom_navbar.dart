import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {

  const CustomBottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'boton1'),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'boton1'),
      ],
    );
  }
}