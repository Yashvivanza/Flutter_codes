import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; 
import 'dart:io'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget 
{ 
  const MyApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Flutter Demo', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
        ), home: const MyHomePage(), ); 
  } 
} 
class MyHomePage extends StatefulWidget 
{ 
  const MyHomePage({super.key}); 
  @override 
  State<MyHomePage> createState() => _MyHomePageState(); 
}
class _MyHomePageState extends State<MyHomePage> 
{ 
  late BannerAd _bannerAd; 
  bool _isBannerAdReady = false; 
  String get bannerAdUnitId 
  { 
    if (Platform.isAndroid) 
    { 
      return 'ca-app-pub-3940256099942544/6300978111'; 
    } 
    else if (Platform.isIOS) 
    { 
      return 'ca-app-pub-3940256099942544/2934735716';
    } 
    else 
    { 
      throw UnsupportedError('Unsupported platform'); 
    } 
  } 
  @override 
  void initState() 
  { 
    super.initState();
    _loadBannerAd();
  }
  void _loadBannerAd() 
  { 
    _bannerAd = BannerAd( 
      adUnitId: bannerAdUnitId, 
      request: const AdRequest(), 
      size: AdSize.banner, 
      listener: BannerAdListener( 
          onAdLoaded: (_) 
          { 
            setState(() { _isBannerAdReady = true; }); 
          }, 
          onAdFailedToLoad: (ad, err) 
          { 
            _isBannerAdReady = false; ad.dispose(); 
          }, 
      ),
    );
   _bannerAd.load(); 
  }
  @override 
  void dispose() 
  { 
    super.dispose(); 
    _bannerAd.dispose(); 
  }
  @override
  Widget build(BuildContext context) 
  {    
    return Scaffold(
            appBar: AppBar(
              title: const Text('AdMob Demo'),
              backgroundColor: Colors.blue,     
              ),
              body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Banner Ad",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),

            if (_isBannerAdReady)
              SizedBox(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
          ],
        ),  
    );  
  }
}