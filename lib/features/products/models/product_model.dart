import 'package:online_store/features/products/models/review_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double? rating;
  final int stock;
  final List<String> tags;
  final String brand;   
  final List<ReviewModel>? reviews;
  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    this.rating = 0.0,
    required this.stock,
    required this.tags,
    required this.brand,
    this.reviews = const [],
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags']),
      brand: json['brand'] ?? 'Unknown',
      reviews: (json['reviews'] as List).map((review) => ReviewModel.fromJson(review)).toList(),
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
    );
  }
}