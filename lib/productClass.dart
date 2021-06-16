// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product(
    this.compostId,
    this.cName,
    this.quantity,
    this.availableQuantity,
    this.rate,
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
  );

  String compostId;
  CName cName;
  Quantity quantity;
  Quantity availableQuantity;
  String rate;
  The0 the0;
  The0 the1;
  The0 the2;
  The0 the3;
  The0 the4;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    json["compost_id"],
    cNameValues.map[json["c_name"]],
    quantityValues.map[json["quantity"]],
    quantityValues.map[json["available_quantity"]],
    json["rate"],
    json["0"] == null ? null : The0.fromJson(json["0"]),
    json["1"] == null ? null : The0.fromJson(json["1"]),
    json["2"] == null ? null : The0.fromJson(json["2"]),
    json["3"] == null ? null : The0.fromJson(json["3"]),
    json["4"] == null ? null : The0.fromJson(json["4"]),
  );

  Map<String, dynamic> toJson() => {
    "compost_id": compostId,
    "c_name": cNameValues.reverse[cName],
    "quantity": quantityValues.reverse[quantity],
    "available_quantity": quantityValues.reverse[availableQuantity],
    "rate": rate,
    "0": the0 == null ? null : the0.toJson(),
    "1": the1 == null ? null : the1.toJson(),
    "2": the2 == null ? null : the2.toJson(),
    "3": the3 == null ? null : the3.toJson(),
    "4": the4 == null ? null : the4.toJson(),
  };
}

enum Quantity { THE_250_GM, THE_500_GM, THE_750_GM, THE_1_KG }

final quantityValues = EnumValues({
  "1kg": Quantity.THE_1_KG,
  "250gm": Quantity.THE_250_GM,
  "500gm": Quantity.THE_500_GM,
  "750gm": Quantity.THE_750_GM
});

enum CName { PREMIUM_COMPOST, BLACK_GOLD_PREMIUM, BLACK_GOLD, PRELITE, BIO_ORGANIC_MANURE }

final cNameValues = EnumValues({
  "Bio-organic Manure": CName.BIO_ORGANIC_MANURE,
  "Black Gold": CName.BLACK_GOLD,
  "Black Gold Premium": CName.BLACK_GOLD_PREMIUM,
  "Prelite": CName.PRELITE,
  "Premium Compost": CName.PREMIUM_COMPOST
});

class The0 {
  The0({
    this.compostId,
    this.cName,
    this.quantity,
    this.availableQuantity,
    this.rate,
    this.the0,
    this.the1,
    this.the2,
    this.the3,
  });

  String compostId;
  CName cName;
  Quantity quantity;
  Quantity availableQuantity;
  String rate;
  The0 the0;
  The0 the1;
  The0 the2;
  The0 the3;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
    compostId: json["compost_id"],
    cName: cNameValues.map[json["c_name"]],
    quantity: quantityValues.map[json["quantity"]],
    availableQuantity: quantityValues.map[json["available_quantity"]],
    rate: json["rate"],
    the0: json["0"] == null ? null : The0.fromJson(json["0"]),
    the1: json["1"] == null ? null : The0.fromJson(json["1"]),
    the2: json["2"] == null ? null : The0.fromJson(json["2"]),
    the3: json["3"] == null ? null : The0.fromJson(json["3"]),
  );

  Map<String, dynamic> toJson() => {
    "compost_id": compostId,
    "c_name": cNameValues.reverse[cName],
    "quantity": quantityValues.reverse[quantity],
    "available_quantity": quantityValues.reverse[availableQuantity],
    "rate": rate,
    "0": the0 == null ? null : the0.toJson(),
    "1": the1 == null ? null : the1.toJson(),
    "2": the2 == null ? null : the2.toJson(),
    "3": the3 == null ? null : the3.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
