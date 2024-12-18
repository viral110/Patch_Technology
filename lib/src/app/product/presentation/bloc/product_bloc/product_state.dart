import 'package:patch_task/src/app/product/data/model/product_list_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailed extends ProductState {}

class ProductLoadSuccessfully extends ProductState {
  final List<ProductListModel>? entities;

  ProductLoadSuccessfully({required this.entities});
}

// class PriceByFilterSuccessfully extends ProductState {
//   final List<ProductListModel>? entities;
//
//   PriceByFilterSuccessfully({required this.entities});
//
//   PriceByFilterSuccessfully copyWith({
//     final List<ProductListModel>? entities
//   }) {
//     return PriceByFilterSuccessfully(
//       entities: entities ?? this.entities
//     );
//   }
// }
