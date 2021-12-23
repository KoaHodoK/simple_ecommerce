import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/category/bloc/category_bloc.dart';
import 'package:ecommerce_app/blocs/products/bloc/product_bloc.dart';
import 'package:ecommerce_app/widgets/hero_carousel.dart';
import 'package:ecommerce_app/widgets/product_carousel.dart';
import 'package:ecommerce_app/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero To Unicorn',
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.5,
                    initialPage: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: false,
                  ),
                  items: state.categories
                      .map((cate) => HeroCarouselWidget(category: cate))
                      .toList(),
                );
              } else {
                return const Center(child: Text('Something Went Wrong'));
              }
            },
          ),
          const SectionTitle(
            title: "RECOMMENDED",
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((p) => p.isRecommended == true)
                        .toList());
              } else {
                return const Center(
                  child: Text('ERROR'),
                );
              }
            },
          ),
          const SectionTitle(
            title: "POPULAR",
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((p) => p.isPopular == true)
                        .toList());
              } else {
                return const Center(
                  child: Text('ERROR'),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: const Custom_BottomAppBar(),
    );
  }
}
