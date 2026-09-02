import 'package:flutter/material.dart';
import 'package:flutter_application_108/pages/home_page.dart';
import 'package:flutter_application_108/pages/profile_page.dart';
import 'package:flutter_application_108/pages/settings_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = 
  [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('First Page'),
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 48) 
              ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home-page');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('S E T T I N G S'),
              onTap: () {
                Navigator.pushNamed(context, '/settings-page');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('P R O F I L E'),
              onTap: () {
                Navigator.pushNamed(context, '/profile-page');
              },
            ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: 
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],

        ),
    );
  }
}

