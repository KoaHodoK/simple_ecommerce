import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());
  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapCartProductRemovedToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {
      yield CartError();
    }
  }

  Stream<CartState> _mapCartProductAddedToState(
      CartProductAdded event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)));
        print('ADDED ${event.product.name}');
      } catch (_) {
        yield CartError();
      }
    }
  }

  Stream<CartState> _mapCartProductRemovedToState(
      CartProductRemoved event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (_) {
        yield CartError();
      }
    }
  }
}
