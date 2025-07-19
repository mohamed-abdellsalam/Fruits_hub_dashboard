import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/models/review_model.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;

  ProductModel({
    required this.reviews,
    required this.expirationMonths,
    required this.numberOfcalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
  });

  factory ProductModel.fromEntity(
    ProductEntity addProductInputEntity,
  ) {
    return ProductModel(
      expirationMonths: addProductInputEntity.expirationMonths,
      numberOfcalories: addProductInputEntity.numberOfcalories,
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      unitAmount: addProductInputEntity.unitAmount,
      isOrganic: addProductInputEntity.isOrganic,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'numberOfcalories': numberOfcalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
