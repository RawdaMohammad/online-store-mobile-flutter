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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Products'),
      // ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if(state is ProductsLoading) {
            return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
          }
          if(state is ProductsLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210,
                  mainAxisSpacing: screenHeight * 0.01,
                  crossAxisSpacing: screenWidth * 0.01,
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
            return Center(child: Text(state.errorMessage, style: const TextStyle(color: Colors.red, fontSize: 20)));
          }
          return const Center(child: Text('No products found'));
        },
      ),
    );
  }
}