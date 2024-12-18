abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class FilterProductsByPrice extends ProductEvent {
  final String value;

  FilterProductsByPrice(this.value);
}

class FetchProductsByCategories extends ProductEvent {

  final String catName;

  FetchProductsByCategories({required this.catName});

}