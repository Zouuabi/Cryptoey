import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'D8F15892-556F-4B17-A3C7-E614BCB2A718';

class NetworkingHelper {
  NetworkingHelper({
    required this.crypto,
    required this.currency,
  });

  final String crypto;
  final String currency;

  Future<dynamic> getData() async {
    String url =
        "https://rest.coinapi.io/v1/exchangerate/$crypto/$currency/?apikey=$apiKey";
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;

    var decodedData = jsonDecode(data);

    return (data);
  }
}
