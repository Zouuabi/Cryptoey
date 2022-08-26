import 'package:flutter/material.dart';
import 'package:bitcoin_tricker/coind_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({
    Key? key,
    required this.bitcoinData,
    required this.ethiriumData,
    required this.lightCoinData,
  }) : super(key: key);

  final dynamic bitcoinData;
  final dynamic ethiriumData;
  final dynamic lightCoinData;

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  double bitcoinPrice = 0;
  double ethiriumPrice = 0;
  double lightCoinPrice = 0;

  @override
  void initState() {
    super.initState();

    updateUi(
      bitcoinData: widget.bitcoinData,
      ethiriumData: widget.ethiriumData,
      lightCoinData: widget.lightCoinData,
    );
  }

  void updateUi({
    required dynamic bitcoinData,
    required dynamic ethiriumData,
    required dynamic lightCoinData,
  }) {
    setState(() {
      bitcoinPrice = bitcoinData['rate'];

      bitcoinPrice = ethiriumData['rate'];

      bitcoinPrice = lightCoinData['rate'];
    });
  }

  /// the initial value of the currency picker
  String selectedValue = 'USD';

  /// [getDropDownItems] generates a list of [items]for
  /// the  [DropDownButton]
  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    /// loop through the list of currencies [coin_data.dart]

    for (String currencie in currencieList) {
      /// build each [dropDownMenuItem] with the selected
      /// currencie and it's value
      dropDownItems.add(
        DropdownMenuItem(
          value: currencie,
          child: Text(currencie),
        ),
      );
    }

    /// whene the Loop reach the end of the list
    /// we will return the [dropDownItems] list that
    /// we created and then call it in [DropDownButton] items property
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Coin'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCryptoCards(
                crypto: 'BTC', price: bitcoinPrice, currency: selectedValue),
            getCryptoCards(
                crypto: 'ETH', price: ethiriumPrice, currency: selectedValue),
            getCryptoCards(
                crypto: 'LTC', price: lightCoinPrice, currency: selectedValue),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: 50,
              child: Center(
                child: DropdownButton(
                  value: selectedValue,
                  items: getDropdownItems(),
                  onChanged: (value) async {
                    setState(() async {
                      selectedValue = value.toString();
                      // var newData = await NetworkingHelper(
                      //         crypto: 'BTC', currency: selectedValue)
                      //     .getData();
                    });
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Card getCryptoCards(
      {required String crypto,
      required double price,
      required String currency}) {
    return Card(
      elevation: 5,
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 50,
        ),
        child: Text(
          "1 $crypto = $price  $currency",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
