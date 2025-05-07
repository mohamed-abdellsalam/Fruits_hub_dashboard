import 'dart:io';

class AddProductInputEntity {
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

  AddProductInputEntity({
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
