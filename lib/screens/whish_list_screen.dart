import 'package:ecommerce_app/blocs/wishlist/whishlist_bloc_bloc.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhishListScreen extends StatelessWidget {
  const WhishListScreen({Key? key}) : super(key: key);
  static const routeName = "/wish_list";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => WhishListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Your Wishlist',
      ),
      body: BlocBuilder<WhishlistBlocBloc, WhishlistBlocState>(
        builder: (context, state) {
          if (state is WhishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WhishlistLoaded) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.4,
                ),
                itemCount: state.wishList.products.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return Center(
                      child: ProductCard(
                    product: state.wishList.products[i],
                    widthFactor: 1.1,
                    isWishList: true,
                  ));
                });
          } else {
            return const Text('Something Went Wrong!');
          }
        },
      ),
      bottomNavigationBar: const Custom_BottomAppBar(),
    );
  }
}
