import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.apps_rounded),
          label: 'Достижения',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: 'Руководство',
        ),
      ],
      selectedItemColor: Colors.green,
      currentIndex: selectedIndex,
      onTap: onItemSelected,
    );
  }
}
