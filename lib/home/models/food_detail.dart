import 'package:flutter/material.dart';

class FoodDetail {
  String? title;
  List<Attribute>? attributes;
  String? picture;
  String? pictureAlt;
  String? description;
  List<String>? ingredients;
  String? method;
  ColorScheme? colorScheme;
  Color? textColor;

  FoodDetail(
      {this.title,
      this.attributes,
      this.picture,
      this.description,
      this.ingredients,
      this.method,
      this.textColor,
      this.colorScheme,
      this.pictureAlt});

  @override
  String toString() {
    return 'FoodDetail(title: $title, attributes: $attributes, picture: $picture, description: $description, ingredients: $ingredients, method: $method),backgroundColor:$colorScheme';
  }

  factory FoodDetail.fromJson(Map<String, dynamic> json) => FoodDetail(
      title: json['title'] as String?,
      attributes: json['attributes'] as List<Attribute>?,
      picture: json['picture'] as String?,
      description: json['description'] as String?,
      ingredients: json['ingredients'] as List<String>?,
      method: json['method'] as String?,
      colorScheme: json['colorScheme'] as ColorScheme?);

  Map<String, dynamic> toJson() => {
        'title': title,
        'attributes': attributes,
        'picture': picture,
        'description': description,
        'ingredients': ingredients,
        'method': method,
      };

  FoodDetail copyWith({
    String? title,
    List<Attribute>? attributes,
    String? picture,
    String? description,
    List<String>? ingredients,
    String? method,
  }) {
    return FoodDetail(
      title: title ?? this.title,
      attributes: attributes ?? this.attributes,
      picture: picture ?? this.picture,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      method: method ?? this.method,
    );
  }
}

class Attribute {
  final Icon icon;
  final String title;
  Attribute({required this.icon, required this.title});
}
