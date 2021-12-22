import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);
  static const routeName = "/catalog_screen";
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(
              category: category,
            ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct =
        Product.products.where((c) => c.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: categoryProduct.length,
          itemBuilder: (BuildContext ctx, int i) {
            return Center(
                child: ProductCard(
              product: categoryProduct[i],
              widthFactor: 2.2,
            ));
          }),
      bottomNavigationBar: const Custom_BottomAppBar(),
    );
  }
}
