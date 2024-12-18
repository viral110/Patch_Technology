class ProductListModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String category;
  final Rating? rating;

  ProductListModel({required this.id, required this.title, required this.price, required this.image, required this.description, required this.category ,required this.rating});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'],
      category: json['category'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
}

class Rating {
  dynamic rate;
  dynamic count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
