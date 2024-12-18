import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:patch_task/core/failures.dart';
import 'package:patch_task/src/app/product/data/data_source/product_remote_data_source_page.dart';
import 'package:patch_task/src/app/product/data/mappers/product_list_mappers.dart';
import 'package:patch_task/src/app/product/data/model/product_list_model.dart';
import 'package:patch_task/src/app/product/domain/entities/product_list_entities.dart';
import 'package:patch_task/src/app/product/domain/repository/product_repository.dart';

@Singleton(as: ProductListRepository)
class ProductRepositoryImpl extends ProductListRepository {
  final ProductRemoteDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource,);

  @override
  Future<Either<Failure, List<ProductListModel>>> getProductList() async {
    try {
      Response response = await _dataSource.getProductList();

      if (response.statusCode == 200) {
        List entities = response.data;
        return Right(entities.map((item) => ProductListModel.fromJson(item)).toList());
      } else {
        return Left(ProductListFailure());
      }
    } catch (e) {
      log("e : $e");
      return Left(ProductListFailure());
    }
  }


  @override
  Future<Either<Failure, List>> getCategoryList() async {
    try {
      Response response = await _dataSource.getCategoryList();

      if (response.statusCode == 200) {
        List entities = response.data;
        return Right(entities);
      } else {
        return Left(CategoryListFailure());
      }
    } catch (e) {
      log("e : $e");
      return Left(CategoryListFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductListModel>>> getProductsByCategoryList({required String catName}) async {
    try {
      Response response = await _dataSource.getProductsCategoryList(catName: catName);

      if (response.statusCode == 200) {
        List entities = response.data;
        return Right(entities.map((item) => ProductListModel.fromJson(item)).toList());
      } else {
        return Left(ProductByCategoryListFailure());
      }
    } catch (e) {
      log("e : $e");
      return Left(ProductByCategoryListFailure());
    }
  }

}
