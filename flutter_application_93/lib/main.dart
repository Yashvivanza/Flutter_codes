import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interstitial Ad Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InterstitialAd? _interstitialAd;

  int _numInterstitialLoadAttempts = 0;
  final int maxFailedLoadAttempts = 3;

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // Test Interstitial Ad ID
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          debugPrint('Rewarded Ad Loaded');

          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;

          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('Failed to load Interstitial Ad: $error');

          _numInterstitialLoadAttempts++;

          _interstitialAd = null;

          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ad is not loaded yet'),
        ),
      );
      return;
    }

    _interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        debugPrint('Ad displayed');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        debugPrint('Ad dismissed');

        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent:
          (InterstitialAd ad, AdError error) {
        debugPrint('Failed to show ad: $error');

        ad.dispose();
        _createInterstitialAd();
      },
    );

    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewarded Ad'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showInterstitialAd,
          child: const Text(
            'Show Rewarded Ad',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}