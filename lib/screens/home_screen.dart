import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/hero_carousel.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:ecommerce_app/widgets/product_carousel.dart';
import 'package:ecommerce_app/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';

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
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.5,
              initialPage: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: false,
            ),
            items: Category.categories
                .map((cate) => HeroCarouselWidget(category: cate))
                .toList(),
          ),
          const SectionTitle(
            title: "RECOMMENDED",
          ),
          ProductCarousel(
              products: Product.products
                  .where((p) => p.isRecommended == true)
                  .toList()),
          const SectionTitle(
            title: "POPULAR",
          ),
          ProductCarousel(
              products:
                  Product.products.where((p) => p.isPopular == true).toList()),
        ],
      ),
      bottomNavigationBar: const Custom_BottomAppBar(),
    );
  }
}
