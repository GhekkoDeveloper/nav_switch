import 'package:flutter/material.dart';
import 'package:nav_switch/app/screens/screen01.dart';
import 'package:nav_switch/app/screens/screen02.dart';
import 'package:nav_switch/app/screens/screen03.dart';
import 'package:nav_switch/app/screens/screen04.dart';
import 'package:nav_switch/app/widgets/nav_switch.dart';

class DrawerNav extends StatefulWidget {
  const DrawerNav({super.key});

  @override
  State<DrawerNav> createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Screen01(), Screen02(), Screen03(), Screen04()];
  final List<String> _titles = ['Home', 'Search', 'Profile', 'Page'];

  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex]),
      actions: [NavSwitch()],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () => _onSelectPage(0),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              selected: _selectedIndex == 1,
              onTap: () => _onSelectPage(1),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              selected: _selectedIndex == 2,
              onTap: () => _onSelectPage(2),
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('Page'),
              selected: _selectedIndex == 3,
              onTap: () => _onSelectPage(3),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
