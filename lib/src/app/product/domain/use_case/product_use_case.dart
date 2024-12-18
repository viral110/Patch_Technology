import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patch_task/core/failures.dart';
import 'package:patch_task/src/app/product/data/model/product_list_model.dart';
import 'package:patch_task/src/app/product/domain/repository/product_repository.dart';

@injectable
class ProductListUseCase {
  final ProductListRepository _productListRepository;

  ProductListUseCase(this._productListRepository);

  Future<Either<Failure, List<ProductListModel>>> getProductList() async {
    return _productListRepository.getProductList();
  }

  Future<Either<Failure, List>> getCategoryList() async {
    return _productListRepository.getCategoryList();
  }

  Future<Either<Failure, List<ProductListModel>>> getProductsByCategoryList({required String catName}) async {
    return _productListRepository.getProductsByCategoryList(catName: catName);
  }
}
