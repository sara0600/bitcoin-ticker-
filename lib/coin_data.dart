import 'package:http/http.dart';
import 'dart:convert';
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

class CoinData {

  Future getBetCoin(String selectedItem) async{
    late String valueS;

    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$selectedItem?apiKey=9C4B5AE5-C085-4BAB-A6FA-F25D05A24816');
    var response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double value =decodedData['rate'];
      return value;
    }
    else{
      print(response.statusCode);
      throw'problem with the get request';
    }}
  Future getETHCoin(String selectedItem) async{
    late String valueS;

    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/ETH/$selectedItem?apiKey=9C4B5AE5-C085-4BAB-A6FA-F25D05A24816');
    var response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double value =decodedData['rate'];
      return value;
    }
    else{
      print(response.statusCode);
      throw'problem with the get request';
    }}
  Future getLTCCoin(String selectedItem) async{
    late String valueS;

    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/LTC/$selectedItem?apiKey=9C4B5AE5-C085-4BAB-A6FA-F25D05A24816');
    var response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double value =decodedData['rate'];
      return value;
    }
    else{
      print(response.statusCode);
      throw'problem with the get request';
    }}
}