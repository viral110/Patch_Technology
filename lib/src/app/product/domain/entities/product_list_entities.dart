import 'package:equatable/equatable.dart';

class ProductListEntities extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntities rating;

  const ProductListEntities({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props => [id,title,price, description, category, image, rating];
}


class RatingEntities extends Equatable {
  final double rate;
  final int count;

  const RatingEntities({required this.rate, required this.count});

  @override
  List<Object?> get props => [rate, count];
}
