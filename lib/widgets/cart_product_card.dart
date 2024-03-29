import 'package:ecommerce_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(children: [
        Image.network(
          product.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: Theme.of(context).textTheme.headline5),
              Text('\$ ${product.price}',
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    },
                    icon: const Icon(Icons.add_circle)),
                Text(quantity.toString(),
                    style: Theme.of(context).textTheme.headline5),
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    },
                    icon: const Icon(Icons.remove_circle)),
              ],
            );
          },
        )
      ]),
    );
  }
}
