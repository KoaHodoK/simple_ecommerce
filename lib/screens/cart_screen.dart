import 'package:ecommerce_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/widgets/cart_product_card.dart';
import 'package:ecommerce_app/widgets/summary_order.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CartLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(const Cart().deliveryMessage,
                          style: Theme.of(context).textTheme.headline5),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text('Add More Item',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white)))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        return CartProductCard(
                            product: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .elementAt(i),
                            quantity: state.cart
                                .productQuantity(state.cart.products)
                                .values
                                .elementAt(i));
                      },
                      itemCount: state.cart
                          .productQuantity(state.cart.products)
                          .length,
                    ),
                  ),
                ]),
                const OrderSummary(),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }
      }),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 50,
            alignment: Alignment.center,
            color: Colors.black,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/check_out');
                },
                child: Text('GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3!))),
      ),
    );
  }
}
