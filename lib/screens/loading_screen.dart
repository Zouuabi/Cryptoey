import 'package:bitcoin_tricker/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitSpinningLines;

import 'price_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<dynamic> getData() async {
    dynamic bitcoinData =
        await NetworkingHelper(crypto: 'BTC', currency: 'USD').getData();
    print(bitcoinData);
    dynamic ethiriumData =
        await NetworkingHelper(crypto: 'ETH', currency: 'USD').getData();
    print(ethiriumData);
    dynamic lightCoinData =
        await NetworkingHelper(crypto: 'LTC', currency: 'USD').getData();
    print(lightCoinData);

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(
        bitcoinData: bitcoinData,
        ethiriumData: ethiriumData,
        lightCoinData: lightCoinData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          itemCount: 4,
        ),
      ),
    );
  }
}
