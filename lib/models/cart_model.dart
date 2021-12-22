import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

//subtotal calculation
  double get subtotal => products.fold(0, (total, p) => total += p.price);
  String get subTotalString => subtotal.toStringAsFixed(2);

  //delivery fee calculation
  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
//delivery message
  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$ ${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get deliveryMessage => freeDelivery(subtotal);
//Finally Total Fee
  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get totalMessage => total(subtotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
