import 'package:ecommerce_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/whishlist_bloc_bloc.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WhishlistBlocBloc()..add(StarWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
