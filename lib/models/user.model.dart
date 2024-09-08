import 'package:kisaan_konnect/models/cart.model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class MarketItem {
  String fullName;
  String id;
  String useremail;

  MarketItem(
      {required this.fullName, required this.id, required this.useremail});

  factory MarketItem.fromJson(String str) =>
      MarketItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MarketItem.fromMap(Map<String, dynamic> json) => MarketItem(
      fullName: json["fullName"],
      id: json["_id"],
      useremail: json["useremail"]);

  Map<String, dynamic> toMap() =>
      {"fullName": fullName, "_id": id, "useremail": useremail};
}
