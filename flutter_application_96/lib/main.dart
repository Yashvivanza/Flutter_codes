import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    // ignore: avoid_print
    print('Connectivity changed: $_connectionStatus');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Connectivity Plus Example'),
        elevation: 4,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 1),
          Text(_connectionStatus.hasConnectivity
              ? 'Connectivity available'
              : 'No connectivity',style: TextStyle(fontSize: 20)),
          const Spacer(flex: 1),

          // Connection Type Button
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                _connectionStatus.contains(ConnectivityResult.none)
                    ? 'No Connection'
                    : _connectionStatus
                        .map((e) => e.name.toUpperCase())
                        .join(', '),
              ),
            ),
          ),
          const Spacer(flex: 1),
          Text(
            'Active connection types:',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          ListView(
            shrinkWrap: true,
            children: List.generate(
                _connectionStatus.length,
                (index) => Center(
                      child: Text(
                        _connectionStatus[index].toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}