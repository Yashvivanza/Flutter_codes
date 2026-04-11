import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Items App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int? editingIndex;
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];

  void addItem() {
  setState(() {
    if (editingIndex == null) {
      items.add(_controller.text);
    } else {
      items[editingIndex!] = _controller.text;
      editingIndex = null;
    }
    _controller.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type something',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                
                ElevatedButton(
                  onPressed: addItem,
                  child: const Text('Add'),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]),
                      onTap: () {
                        setState(() {
                          _controller.text = items[index]; // put text in field
                          editingIndex = index; // mark editing
                        });
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever_rounded),
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}