import 'package:flutter/material.dart';
import 'package:online_store/features/products/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  late double discountedPrice;
  ProductCard({super.key, required this.product}){
    discountedPrice = product.price - (product.discountPercentage / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(
          color: Theme.of(context).primaryColor, 
          width: 1.3,
        ),
      ),
      elevation: 4,     
      shadowColor: const Color(0x64000000),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: wrap with GestureDetector to navigate to product details
              SizedBox(
                child: Image.network(product.thumbnail, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.titleLarge, 
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP ${discountedPrice.toStringAsFixed(2)}', 
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // Show original price with strikethrough if there is a discount
                        if(product.discountPercentage != 0.0)
                          Text(
                            '${product.price} EGP',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Theme.of(context).secondaryHeaderColor,
                              decorationThickness: 2,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Review', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(width: 4),
                        Text('(${product.rating!.toStringAsFixed(1)})', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(width: 4),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        // const Spacer(),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.add_circle,
                        //     color: Theme.of(context).primaryColor,
                        //     size: 35,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                // toggle favorite
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                // add to cart
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}