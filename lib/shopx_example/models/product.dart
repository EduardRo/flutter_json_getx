// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
  });

  int id;
  Brand brand;
  String name;
  String price;

  var isFavorite = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": "maybelline",
        "name": name,
        "price": price,
      };
}

// ignore: constant_identifier_names
enum Brand { MAYBELLINE }

//final brandValues = EnumValues({"maybelline": Brand.MAYBELLINE});

/* class ProductColor {
  ProductColor({
    required this.hexValue,
    required this.colourName,
  });

  String hexValue;
  String colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        // ignore: prefer_if_null_operators
        colourName: json["colour_name"] == null ? null : json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        // ignore: prefer_if_null_operators, unnecessary_null_comparison
        "colour_name": colourName == null ? null : colourName,
      };
} */

/* class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
 */