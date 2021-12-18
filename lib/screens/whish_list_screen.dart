import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';

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
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Your Wishlist',
      ),
      bottomNavigationBar: Custom_BottomAppBar(),
    );
  }
}
