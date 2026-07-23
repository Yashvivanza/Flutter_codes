import 'package:flutter/material.dart';
// List Tile Widget
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
            children: [
              ListTile(
                tileColor: Colors.redAccent,
                textColor: Colors.white,
                iconColor: Colors.white,
                splashColor: Colors.lime,
                leading: const CircleAvatar(child: Text("A"),),
                title: const Text('ABC Mam'),
                subtitle: const Text('Indus'),
                trailing: const Icon(Icons.navigate_next),
                onTap: ()
                {
                },
                onLongPress: ()
                {
                }
            
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 248, 107, 107),
                textColor: Colors.white,
                iconColor: Colors.white,
                splashColor: Colors.lime,
                leading: const CircleAvatar(child: Text("B"),),
                title: const Text('XYZ Mam'),
                subtitle: const Text('Indus'),
                trailing: const Icon(Icons.navigate_next),
                onTap: ()
                {
                },
                onLongPress: ()
                {
                }
            
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 243, 125, 125),
                textColor: Colors.white,
                iconColor: Colors.white,
                splashColor: Colors.lime,
                leading: const CircleAvatar(child: Text("B"),),
                title: const Text('XYZ Mam'),
                subtitle: const Text('Indus'),
                trailing: const Icon(Icons.navigate_next),
                onTap: ()
                {
                },
                onLongPress: ()
                {
                }
            
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 245, 137, 137),
                textColor: Colors.white,
                iconColor: Colors.white,
                splashColor: Colors.lime,
                leading: const CircleAvatar(child: Text("B"),),
                title: const Text('XYZ Mam'),
                subtitle: const Text('Indus'),
                trailing: const Icon(Icons.navigate_next),
                onTap: ()
                {
                },
                onLongPress: ()
                {
                }
            
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 252, 155, 155),
                textColor: Colors.white,
                iconColor: Colors.white,
                splashColor: Colors.lime,
                leading: const CircleAvatar(child: Text("B"),),
                title: const Text('XYZ Mam'),
                subtitle: const Text('Indus'),
                trailing: const Icon(Icons.navigate_next),
                onTap: ()
                {
                },
                onLongPress: ()
                {
                }
            
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 245, 186, 186),
                textColor: Colors.white,
                iconColor: Colors.white,
                splashColor: Colors.lime,
                leading: const CircleAvatar(child: Text("B"),),
                title: const Text('XYZ Mam'),
                subtitle: const Text('Indus'),
                trailing: const Icon(Icons.navigate_next),
                onTap: ()
                {
                },
                onLongPress: ()
                {
                }
            
              )
            ],
          ),
    );
  }
}
