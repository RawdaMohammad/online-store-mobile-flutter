part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<ProductModel> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductState {
  final String errorMessage;

  ProductsError(this.errorMessage);
}
