part of 'whishlist_bloc_bloc.dart';

abstract class WhishlistBlocState extends Equatable {
  const WhishlistBlocState();

  @override
  List<Object> get props => [];
}

class WhishlistLoading extends WhishlistBlocState {}

class WhishlistLoaded extends WhishlistBlocState {
  final WishList wishList;
  const WhishlistLoaded({this.wishList = const WishList()});
  @override
  List<Object> get props => [wishList];
}

class WhishlistError extends WhishlistBlocState {}
