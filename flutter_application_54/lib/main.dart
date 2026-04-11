import 'package:flutter/material.dart';

// Add items and by clicking any item should be display on the second scr
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Item App',
      theme: ThemeData(
        primarySwatch: const Color.fromARGB(255, 30, 64, 92),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Add Item App'),
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
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];

  void addItem()
  {
    setState((){
      if(_controller.text.isNotEmpty)
      {
        items.add(_controller.text);
        _controller.clear();
      }
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
                        hintText: 'Type an item',
                        border: OutlineInputBorder(),
                      ),
                    ) 
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: addItem,
                    child: const Text('Add'),
                  )
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
                      onTap:()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => 
                          ItemDetailPage(item: items[index], text: items[index],)),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever_rounded),
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });         
                        },
                      
                    ),
                    )
                    );
                  },
                ),

              )
          ],
        ),
      ),
    );
  }
}
class ItemDetailPage extends StatelessWidget
{
  final String text;
  const ItemDetailPage({super.key, required this.text, required String item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
        backgroundColor: Colors.blueAccent,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      
      ),
      body: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

