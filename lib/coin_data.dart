import 'dart:convert';

import 'package:bitcoin_ticker/secret.dart';
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

const String openCoinAPIURL = "https://rest.coinapi.io/v1/exchangerate";

class CoinData {
  Future<double> getCoinData() async {
    http.Response response =
        await http.get('$openCoinAPIURL/BTC/USD?&apikey=$kCoinAPI');

    if (response.statusCode == 200) {
      dynamic decodeData = jsonDecode(response.body);
      double rate = decodeData['rate'];
      return rate;
    } else {
      print(response.statusCode);
    }

    return 0;
  }
}
