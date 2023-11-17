
import 'package:flutter/material.dart';
import '../style/style.dart';

BottomNavigationBar bottomNavigationBar(currentIndex, onItemTap){
  return BottomNavigationBar(
    items:  const [
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: 'New Task',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: 'Completed',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: 'Canceled',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: 'Progress',
      ),
    ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: onItemTap,

  );
}