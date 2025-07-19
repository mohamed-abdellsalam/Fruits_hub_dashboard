import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entityl.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final double price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfcalories;
  final int unitAmount;
  final num avgRating = 0;
  final int ratingCount = 0;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.reviews,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numberOfcalories,
    required this.unitAmount,
    this.isOrganic = false,
    this.imageUrl,
  });
}
