import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 165,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (ct, i) {
            return ProductCard(
              product: products[i],
            );
          },
          itemCount: products.length,
        ));
  }
}
