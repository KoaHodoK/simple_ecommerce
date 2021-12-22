part of 'whishlist_bloc_bloc.dart';

abstract class WhishlistBlocEvent extends Equatable {
  const WhishlistBlocEvent();

  @override
  List<Object> get props => [];
}

class StarWishList extends WhishlistBlocEvent {}

class AddWishList extends WhishlistBlocEvent {
  final Product product;
  const AddWishList(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveWishList extends WhishlistBlocEvent {
  final Product product;
  const RemoveWishList(this.product);
  @override
  List<Object> get props => [product];
}
