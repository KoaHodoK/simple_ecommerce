import 'package:ecommerce_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final bool isWishList;
  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.isWishList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product_screen', arguments: product);
      },
      child: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / widthFactor,
          height: 150,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 80,
            decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
          ),
        ),
        Positioned(
          top: 60,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 70,
            decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$ ${Product.products[0].price.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Colors.white),
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                              const snackbar =
                                  SnackBar(content: Text('Added to Cart!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            },
                          ),
                        );
                      }
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const Text('Something Went Wrong');
                      }
                    },
                  ),
                  isWishList
                      ? Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () {},
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
