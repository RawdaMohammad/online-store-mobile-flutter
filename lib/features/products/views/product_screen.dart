import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/widgets/product_card.dart';
import 'package:online_store/features/products/models/product_model.dart';
import 'package:online_store/features/products/services/product_service.dart';
import 'package:online_store/features/products/viewmodels/product_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if(state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ProductsLoaded) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 0.58,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: state.products[index]);
                },
              ),
            );
          }
          if(state is ProductsError) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: Text('No products found'));
        },
      ),
    );
  }
}