import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('First Page'),
      ),
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
          ],
        )
      ),
    );
  }
}

