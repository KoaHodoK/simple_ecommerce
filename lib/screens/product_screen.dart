import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/whishlist_bloc_bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/wish_list_model.dart';
import 'package:ecommerce_app/widgets/hero_carousel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final Product p;
  const ProductScreen({Key? key, required this.p}) : super(key: key);
  static const routeName = "/product_screen";
  static Route route({required Product pp}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              p: pp,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: p.name,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.5,
              initialPage: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: false,
            ),
            items: [HeroCarouselWidget(product: p)],
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.black.withAlpha(50),
                alignment: Alignment.bottomCenter,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                color: Colors.black,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        p.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '\$ ${p.price.toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Product Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            initiallyExpanded: true,
            children: [
              ListTile(
                title: Text(
                  'Creates a single-line [ListTile] with an expansion arrow icon that expands or collapses the tile to reveal or hide the [children]. The [initiallyExpanded] property must be non-null.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              'Delivery Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            initiallyExpanded: false,
            children: [
              ListTile(
                title: Text(
                  'Creates a single-line [ListTile] with an expansion arrow icon that expands or collapses the tile to reveal or hide the [children]. The [initiallyExpanded] property must be non-null.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WhishlistBlocBloc, WhishlistBlocState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context.read<WhishlistBlocBloc>().add(AddWishList(p));
                        const snackbar =
                            SnackBar(content: Text('Added to WishList!!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ));
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(p));
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text('ADD TO CART',
                          style: Theme.of(context).textTheme.headline3!));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
