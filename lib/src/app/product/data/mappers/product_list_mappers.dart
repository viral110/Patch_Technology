import 'package:patch_task/src/app/product/data/model/product_list_model.dart';
import 'package:patch_task/src/app/product/domain/entities/product_list_entities.dart';

extension ProductListMapper on ProductListModel {
  ProductListEntities toProductListEntities() {
    return ProductListEntities(
      id: id,
      image: image,
      title: title,
      rating: rating!.toRatingEntities(),
      category: category,
      description: description,
      price: price,
    );
  }
}

extension RatingMapper on Rating {
  RatingEntities toRatingEntities() {
    return RatingEntities(rate: rate, count: count);
  }
}
