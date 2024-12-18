import 'package:dartz/dartz.dart';
import 'package:patch_task/core/failures.dart';
import 'package:patch_task/src/app/product/data/model/product_list_model.dart';
import 'package:patch_task/src/app/product/domain/entities/product_list_entities.dart';

abstract class ProductListRepository {

  Future<Either<Failure, List<ProductListModel>>> getProductList();
  Future<Either<Failure, List>> getCategoryList();
  Future<Either<Failure, List<ProductListModel>>> getProductsByCategoryList({required String catName});
}