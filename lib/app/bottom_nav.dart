import 'package:flutter/material.dart';

import 'screens/screen01.dart';
import 'screens/screen02.dart';
import 'screens/screen03.dart';
import 'screens/screen04.dart';
import 'widgets/nav_switch.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Screen01(),
    Screen02(),
    Screen03(),
    Screen04(),
  ];

  final List<String> _titles = ['Home', 'Search', 'Profile', 'Page'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<NavigationDestination> _navDestinations = [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
    NavigationDestination(icon: Icon(Icons.web), label: 'Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: const [NavSwitch()],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: _navDestinations,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }
}
