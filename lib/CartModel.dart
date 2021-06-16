// To parse this JSON data, do
//
//     final cartList = cartListFromJson(jsonString);

import 'dart:convert';

CartList cartListFromJson(String str) => CartList.fromJson(json.decode(str));

String cartListToJson(CartList data) => json.encode(data.toJson());

class CartList {
  CartList({
    this.error,
    this.success,
    this.notificationdata,
    this.totalAmount,
    this.message,
  });

  bool error;
  int success;
  List<Notificationdatum> notificationdata;
  int totalAmount;
  String message;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    error: json["error"],
    success: json["success"],
    notificationdata: List<Notificationdatum>.from(json["notificationdata"].map((x) => Notificationdatum.fromJson(x))),
    totalAmount: json["total_amount"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "success": success,
    "notificationdata": List<dynamic>.from(notificationdata.map((x) => x.toJson())),
    "total_amount": totalAmount,
    "message": message,
  };
}

class Notificationdatum {
  Notificationdatum({
    this.cName,
    this.quantity,
    this.rate,
    this.image,
    this.count,
    this.compostId,
  });

  String cName;
  String quantity;
  String rate;
  String image;
  String count;
  String compostId;

  factory Notificationdatum.fromJson(Map<String, dynamic> json) => Notificationdatum(
    cName: json["c_name"],
    quantity: json["quantity"],
    rate: json["rate"],
    image: json["image"],
    count: json["count"],
    compostId: json["compost_id"],
  );

  Map<String, dynamic> toJson() => {
    "c_name": cName,
    "quantity": quantity,
    "rate": rate,
    "image": image,
    "count": count,
    "compost_id": compostId,
  };
}
