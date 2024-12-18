
import 'package:patch_task/src/app/product/data/model/product_list_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryFailed extends CategoryState {}

class CategoryLoadSuccessfully extends CategoryState {

  final List<dynamic>? entities;

  CategoryLoadSuccessfully({required this.entities});

}




