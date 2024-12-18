import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:patch_task/src/app/product/data/model/product_list_model.dart';
import 'package:patch_task/src/app/product/domain/use_case/product_use_case.dart';
import 'product_event.dart';
import 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductListUseCase _productListUseCase;

  ProductBloc(this._productListUseCase) : super(ProductInitial()) {
    on<FetchProducts>(_onGetProductListEvent);
    on<FetchProductsByCategories>(_onGetProductByCategoriesListEvent);
    on<FilterProductsByPrice>(_onFilterByPriceEvent);
  }

  Future<void> _onGetProductListEvent(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final result = await _productListUseCase.getProductList();

    result.fold(
      (l) => emit(ProductFailed()),
      (r) => emit(ProductLoadSuccessfully(entities: r)),
    );
  }

  Future<void> _onGetProductByCategoriesListEvent(FetchProductsByCategories event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final result = await _productListUseCase.getProductsByCategoryList(catName: event.catName);

    result.fold(
          (l) => emit(ProductFailed()),
          (r) => emit(ProductLoadSuccessfully(entities: r)),
    );
  }

  Future<void> _onFilterByPriceEvent(FilterProductsByPrice event, Emitter<ProductState> emit) async {
    if(state is ProductLoadSuccessfully){
      final currentState = state as ProductLoadSuccessfully;
      final sortedProducts = List<ProductListModel>.from(currentState.entities!)
        ..sort((a, b) => event.value == "Lowest price first"
            ? a.price.compareTo(b.price)
            : b.price.compareTo(a.price));
      emit(ProductLoadSuccessfully(entities: sortedProducts));
    }
  }



}
