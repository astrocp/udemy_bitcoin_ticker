import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinData {
  Future getCoinData() async {
    String requestURL = '$kCoinBaseURL/BTC/USD?apikey=$kApiKey';
    http.Response response = await http.get(Uri.parse(requestURL));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
