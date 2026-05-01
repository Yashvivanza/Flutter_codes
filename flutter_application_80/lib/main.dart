import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// ================= APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF9FC4D6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 52, 161, 215),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ================= HOME =================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [];
  Map<int, int> cart = {};
  List<int> wishlist = [];
  String search = "";

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    var res = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/products'));

    var data = jsonDecode(res.body);

    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var filtered = products.where((p) =>
        p['title'].toLowerCase().contains(search.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("MyApp"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CartPage(cart: cart, products: products),
                ),
              );
            },
          )
        ],
      ),

      body: Column(
        children: [
          
          // 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search...",
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) {
                setState(() => search = val);
              },
            ),
          ),

          // 📦 LIST
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                var item = filtered[index];
                int id = item['id'];

                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBFD3E6), // 🔵 change color here
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [

                        // IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['images'][0],
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 10),

                        // DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(item['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),

                              Text(item['category']['name'],
                                  style: const TextStyle(
                                      color: Colors.red)),

                              Text("\$${item['price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),

                        // ❤️ Wishlist
                        IconButton(
                          icon: Icon(
                            wishlist.contains(id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              wishlist.contains(id)
                                  ? wishlist.remove(id)
                                  : wishlist.add(id);
                            });
                          },
                        ),

                        // 🛒 Add
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            setState(() {
                              cart[id] = (cart[id] ?? 0) + 1;
                            });
                          },
                        ),
                      ],
                    ));
              },),
          )
        ],
      ),
    );
  }
}

// ================= CART =================
class CartPage extends StatefulWidget {
  final Map<int, int> cart;
  final List products;

  const CartPage(
      {super.key, required this.cart, required this.products});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  double total() {
    double sum = 0;
    widget.cart.forEach((id, qty) {
      var p = widget.products.firstWhere((e) => e['id'] == id);
      sum += p['price'] * qty;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),

      body: Column(
        children: [

          Expanded(
            child: ListView(
              children: widget.cart.keys.map((id) {

                var item =
                    widget.products.firstWhere((e) => e['id'] == id);
                int qty = widget.cart[id]!;

                return ListTile(
                  leading: Image.network(item['images'][0], width: 50),
                  title: Text(item['title']),
                  subtitle: Text("\$${item['price']}"),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // -
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (qty > 1) {
                              widget.cart[id] = qty - 1;
                            } else {
                              widget.cart.remove(id);
                            }
                          });
                        },
                      ),

                      Text("$qty"),

                      // +
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            widget.cart[id] = qty + 1;
                          });
                        },
                      ),

                      // ❌ REMOVE
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            widget.cart.remove(id);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          // 💰 TOTAL
          Container(
            padding: const EdgeInsets.all(15),
            color: const Color.fromARGB(255, 52, 161, 215),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total:",
                    style: TextStyle(fontSize: 18)),
                Text("\$${total().toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          )
        ],
      ),
    );
  }
}