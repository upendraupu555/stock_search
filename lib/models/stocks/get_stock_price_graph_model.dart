// To parse this JSON data, do
//
//     final getStockPriceGraphModel = getStockPriceGraphModelFromJson(jsonString);

import 'dart:convert';

GetStockPriceGraphModel getStockPriceGraphModelFromJson(String str) => GetStockPriceGraphModel.fromJson(json.decode(str));

String getStockPriceGraphModelToJson(GetStockPriceGraphModel data) => json.encode(data.toJson());

class GetStockPriceGraphModel {
  dynamic data;
  Error error;

  GetStockPriceGraphModel({
    required this.data,
    required this.error,
  });

  factory GetStockPriceGraphModel.fromJson(Map<String, dynamic> json) => GetStockPriceGraphModel(
    data: json["data"],
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "error": error.toJson(),
  };
}

class Error {
  int status;
  String name;
  String message;

  Error({
    required this.status,
    required this.name,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    status: json["status"],
    name: json["name"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "name": name,
    "message": message,
  };
}
