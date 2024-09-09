import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kisaan_konnect/constants/global.constants.dart';
import 'package:kisaan_konnect/models/cart.model.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';
import 'package:kisaan_konnect/services/auth.service.dart';
import 'package:kisaan_konnect/utils/shared_pref.dart';

class CartService {
  Future<Response?> getAllCart() async {
    String? usertoken = await SharedPrefService().getData('token');

    if (usertoken != null) {
      Response? userRes = await AuthService().getUserByToken(usertoken);
      Map<String, dynamic> user = await jsonDecode(userRes.body);
      String userId = user["user"]["_id"];
      print(userId);

      //getting cart
      Response cartRes =
          await get(Uri.parse('${GlobalConstants.url}/get-cart/$userId'));

      return cartRes;
    }

    return null;
  }

  Future<Response?> addtoCart(Item item, int quantity) async {
    String? usertoken = await SharedPrefService().getData('token');

    Response? userRes = await AuthService().getUserByToken(usertoken!);
    Map<String, dynamic> user = await jsonDecode(userRes.body);
    String userId = user["user"]["_id"];

    //getting cart

    Map<String, dynamic> body = {
      'userId': userId,
      "productId": item.id,
      "quantity": quantity,
      "imageUrl": item.imageUrl,
      "name": item.name
    };

    print(body);

    Response cartRes = await post(
        Uri.parse('${GlobalConstants.url}/add-to-cart'),
        headers: GlobalConstants.header,
        body: json.encode(body));
    print('here');

    print(cartRes.body);
    return cartRes;
  }
}
