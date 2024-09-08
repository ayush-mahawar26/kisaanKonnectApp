import 'dart:convert';

class Cart {
  String productId;
  String name;
  int quantity;
  int price;

  Cart({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        productId: json["productId"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "name": name,
        "quantity": quantity,
        "price": price,
      };
}
