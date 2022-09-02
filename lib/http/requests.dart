import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:notely/models/fact.dart';

class Requests {
  static Future<Fact> getFact() async {
    final headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'X-RapidAPI-Key': '310ed73ad7msh196ffe14cae00cep17cb91jsnc459ac9e41a2',
      'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com'
    };
    final url = Uri.parse(
        'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random');

    final response = await get(url, headers: headersList);
    debugPrint("getNorrisFact - body: ${response.body}");

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Fact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
