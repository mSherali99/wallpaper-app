// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

import 'package:wallpaper/data/source/local/product_entity.dart';


List<ApiModel> apiModelFromJson(String str) => List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));

String apiModelToJson(List<ApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiModel {
  int id;
  String imageUrl;
  String name;
  String category;

  ApiModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.category,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    id: json["id"],
    imageUrl: json["imageUrl"],
    name: json["name"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageUrl": imageUrl,
    "name": name,
    "category": category,
  };

  ProductEntity toProductEntity(bool isSaved) {
    return ProductEntity(id: id, imageUrl: imageUrl, name: name, category: category, isSaved: isSaved);
  }

}

