import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:patch_task/src/app/product/domain/use_case/product_use_case.dart';
import 'package:patch_task/src/app/product/presentation/bloc/category_bloc/category_event.dart';
import 'package:patch_task/src/app/product/presentation/bloc/category_bloc/category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductListUseCase _productListUseCase;

  CategoryBloc(this._productListUseCase) : super(CategoryInitial()) {
    on<FetchCategories>(_onGetCategoriesListEvent);

  }

  Future<void> _onGetCategoriesListEvent(FetchCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());

    final result = await _productListUseCase.getCategoryList();

    result.fold(
          (l) => emit(CategoryFailed()),
          (r) => emit(CategoryLoadSuccessfully(entities: r)),
    );
  }




}
