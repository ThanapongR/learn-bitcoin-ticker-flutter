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
  'THB',
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
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http
          .get('$openCoinAPIURL/$crypto/$selectedCurrency?&apikey=$kCoinAPI');

      if (response.statusCode == 200) {
        dynamic decodeData = jsonDecode(response.body);
        double rate = decodeData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
