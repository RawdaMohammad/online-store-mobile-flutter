import 'package:online_store/features/products/models/review_model.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double? discountPercentage;
  final double? rating;
  final int stock;
  final List<String> tags;
  final String brand;   
  final List<Review>? reviews;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    required this.stock,
    required this.tags,
    required this.brand,
    this.reviews = const [],
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      tags: List<String>.from(json['tags']),
      brand: json['brand'],
      reviews: (json['reviews'] as List).map((review) => Review.fromJson(review)).toList(),
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
    );
  }
}