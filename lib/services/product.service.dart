import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kisaan_konnect/constants/global.constants.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';
import 'package:http/http.dart';

class ProductService {
  Future<List<Category>> getItems() async {
    Response response = await get(Uri.parse('${GlobalConstants.url}/product'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse[0]['_id']);
      return jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
