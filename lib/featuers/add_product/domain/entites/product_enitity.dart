import 'dart:io';

import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/review_entity.dart';

class ProductEntity {
  final String name;
  final String price;
  final String code;
  final String description;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;
  bool? isOrganic = false;
  final int expiryMonths;
  num avgRating = 0;
  int sellCount = 0;
  num ratingCount = 0;
  final int calories;
  final int amountUnit;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.price,
      required this.code,
      required this.description,
      required this.imageFile,
      required this.isFeatured,
      required this.expiryMonths,
      required this.avgRating,
      required this.ratingCount,
      required this.calories,
      required this.amountUnit,
      required this.reviews,
      required this.sellCount,
      this.imageUrl,
      this.isOrganic});
}
