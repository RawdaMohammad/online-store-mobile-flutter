import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store/features/products/models/product_model.dart';
import 'package:online_store/features/products/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()){
    getProducts();
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      List<ProductModel> productService = await ProductService().getProducts();
      emit(ProductsLoaded(productService));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }

  }
}
