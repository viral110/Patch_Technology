import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final List _properties;

  const Failure([this._properties = const []]);

  @override
  List<Object?> get props => _properties;

}

class ProductListFailure extends Failure {}

class CategoryListFailure extends Failure {}

class ProductByCategoryListFailure extends Failure {}