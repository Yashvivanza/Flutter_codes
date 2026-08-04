import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("GetX Counter"),
      ),
      body: Center(
        child: Obx(
          () => Text(
            'Clicks: ${controller.count}',
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}