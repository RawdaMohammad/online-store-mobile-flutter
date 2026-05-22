import 'package:flutter/material.dart';
import 'package:online_store/features/products/models/product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  late double discountedPrice;
  ProductCard({super.key, required this.product}) {
    discountedPrice = product.price - (product.price * product.discountPercentage / 100);
  }

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFav = false;
  bool isAddedCart = false;

  void _showSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: bgColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        padding: const EdgeInsets.all(14),
      ),
    );
  }

  Future<void> _toggleFavorite() async {
    setState(() {
      isFav = !isFav;
    });
    _showSnackBar(
      isFav ? 'Added to favorites' : 'Removed from favorites',
      isFav ? Colors.green : Colors.red,
    );
  }

  Future<void> _toggleAddToCart() async {
    setState(() {
      isAddedCart = !isAddedCart;
    });
    _showSnackBar(
      isAddedCart ? 'Added to cart' : 'Removed from cart',
      isAddedCart ? Colors.green : Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(color: Color(0xFF9EB6C6), width: 1.8),
      ),
      elevation: 4,
      shadowColor: const Color(0x64000000),
      color: Color(0xFFF4F2F2),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: wrap with GestureDetector to navigate to product details
              Container(
                color: Color(0xFFE8E7E7),
                width: double.infinity,
                height: 190,
                child: Image.network(
                  widget.product.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      widget.product.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),

                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP ${widget.discountedPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // Show original price with strikethrough if there is a discount
                        if (widget.product.discountPercentage != 0.0)
                          Text(
                            '${widget.product.price} EGP',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Theme.of(
                                    context,
                                  ).secondaryHeaderColor,
                                  decorationThickness: 2,
                                ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Review',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${widget.product.rating!.toStringAsFixed(1)})',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
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
                _toggleFavorite();
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
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  size: 25,
                  color: isFav ? Colors.red : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                _toggleAddToCart();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isAddedCart
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: isAddedCart
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}