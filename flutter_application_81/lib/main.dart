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
          backgroundColor: Color.fromARGB(255, 62, 126, 209),
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
  List users = [];
  List<int> wishlist = [];
  String search = "";

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    // 🔥 Replace with your API URL if needed
    var res = await http.get(
      Uri.parse('https://gorest.co.in/public/v2/users'),
    );

    var data = jsonDecode(res.body);

    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var filtered = users.where((u) =>
        u['name'].toLowerCase().contains(search.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),

      body: Column(
        children: [

          // 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search user...",
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) {
                setState(() => search = val);
              },
            ),
          ),

          // 👥 USER LIST
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                var user = filtered[index];
                int id = user['id'];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBFD3E6),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),

                  child: Row(
                    children: [

                      // 👤 AVATAR (first letter)
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          user['name'][0],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // DETAILS
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),

                            Text(
                              user['email'],
                              style: const TextStyle(fontSize: 13),
                            ),

                            Text(
                              "${user['gender']} • ${user['status']}",
                              style: TextStyle(
                                color: user['status'] == "active"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
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
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}