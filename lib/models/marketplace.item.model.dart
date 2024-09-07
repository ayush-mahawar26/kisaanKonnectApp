import 'package:meta/meta.dart';
import 'dart:convert';

class Category {
  String id;
  String title;
  List<Item> items;

  Category({required this.id, required this.title, required this.items});

  // From JSON (Deserialize)
  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Item> itemsList = list.map((i) => Item.fromJson(i)).toList();
    return Category(
      id: json['_id'],
      title: json['title'],
      items: itemsList,
    );
  }

  // To Map (Serialize)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }
}

class Item {
  String id;
  String name;
  String imageUrl;
  int price;

  Item(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price});

  // From JSON (Deserialize)
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }

  // To Map (Serialize)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
