import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:kisaan_konnect/constants/global.constants.dart';

class PredictingService {
  Future<Response?> predictFertilizer(
      int temp,
      int hum,
      int moisture,
      String soilType,
      String croptype,
      int nitrogen,
      int potassium,
      int phos) async {
    Map<String, dynamic> body = {
      "temperature": temp,
      "humidity": hum,
      "moisture": moisture,
      "soilType": soilType,
      "cropType": croptype,
      "nitrogen": nitrogen,
      "potassium": potassium,
      "phosphorous": phos
    };
    try {
      Response res = await post(
          Uri.parse('${GlobalConstants.url}/predict-fertilizer'),
          headers: GlobalConstants.header,
          body: jsonEncode(body));
      return res;
    } catch (e) {
      print(e);
    }
  }
}
