import 'package:flutter/material.dart';

//Create 3 Screen
//▪ Category Screen
//▪ Product List Screen
//▪ Product Details

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
      home: const MyHomePage(title: 'HOME'),
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
  List<String> images = [
    "https://cdn-icons-png.flaticon.com/128/6266/6266076.png",
    "https://cdn-icons-png.flaticon.com/128/3194/3194591.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // ---------------- HEADER ----------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blueAccent,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HOME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Choose Category",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // ---------------- GRID ----------------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemPage(
                            category:
                                index == 0 ? 'Vegetables' : 'Fruits',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(images[index], height: 60),
                          const SizedBox(height: 10),
                          Text(
                            index == 0 ? 'Vegetables' : 'Fruits',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ------------------ Second SCREEN ------------------
class ItemPage extends StatelessWidget {
  final String category;

  const ItemPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final items = category == 'Vegetables'
        ? [
            {'image': 'https://cdn-icons-png.flaticon.com/128/4056/4056860.png', 'name': 'Carrot', 'price': '₹40'},
            {'image': 'https://cdn-icons-png.flaticon.com/128/2346/2346952.png', 'name': 'Broccoli', 'price': '₹80'},
            {'image': 'https://cdn-icons-png.flaticon.com/128/765/765544.png', 'name': 'Spinach', 'price': '₹30'},
            {'image': 'https://cdn-icons-png.flaticon.com/128/1790/1790387.png', 'name': 'Tomato', 'price': '₹25'},
          ]
        : [
            {'image': 'https://cdn-icons-png.flaticon.com/128/3137/3137044.png', 'name': 'Apple', 'price': '₹120'},
            {'image': 'https://cdn-icons-png.flaticon.com/128/2909/2909761.png', 'name': 'Banana', 'price': '₹50'},
            {'image': 'https://cdn-icons-png.flaticon.com/128/1999/1999991.png', 'name': 'Orange', 'price': '₹60'},
            {'image': 'https://cdn-icons-png.flaticon.com/128/765/765560.png', 'name': 'Grapes', 'price': '₹90'},
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3, 
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => detailspage(
                      name: item['name']!,
                      price: item['price']!,
                      image: item['image']!,
                    ),
                  ),
                );
              },

              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      item['image']!,
                      height: 70,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      item['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      item['price']!,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ------------------ 3rd SCREEN ------------------
class detailspage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const detailspage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image, width: 150, height: 150),
            const SizedBox(height: 20),
            Text(name,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(price,
                style: const TextStyle(
                    fontSize: 20, color: Colors.green)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add To Wishlist'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add To Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}