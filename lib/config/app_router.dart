import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/catalog_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/product_screen.dart';
import 'package:ecommerce_app/screens/profile_screen.dart';
import 'package:ecommerce_app/screens/splash_screen.dart';
import 'package:ecommerce_app/screens/whish_list_screen.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route : ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case WhishListScreen.routeName:
        return WhishListScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(pp: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => const Scaffold(
              appBar: CustomAppBar(title: 'Error'),
            ));
  }
}
