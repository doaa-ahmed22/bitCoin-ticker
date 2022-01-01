import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinApiUrl = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';

const apiKey = 'F89F18F1-0FA3-41AF-8D3-9F495558223A9';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String api = '$coinApiUrl/BTC$selectedCurrency';
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['last'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'find a problem';
    }
  }
}
