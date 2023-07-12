import 'package:flutter/material.dart';

class CustomBottom {
   int currentIndex = 0;
    BottomNavigationBar bottomNaviBar( Function(int) ontap) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: ontap,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: 'Görevler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.priority_high),
          label: 'Öncelikli',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Görevler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Geçmiş',
        ),
      ],
    );
  }
}