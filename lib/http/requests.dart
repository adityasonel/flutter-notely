import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notely/models/norris_fact.dart';

class Requests {
  static Future<NorrisFact> getNorrisFact() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'X-RapidAPI-Key': '310ed73ad7msh196ffe14cae00cep17cb91jsnc459ac9e41a2',
      'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com'
    };
    var url = Uri.parse(
        'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random');

    var req = http.Request("GET", url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return NorrisFact.fromJson(jsonDecode(resBody));
    } else {
      throw Exception(res.reasonPhrase.toString());
    }
  }
}
